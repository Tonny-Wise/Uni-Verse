-- ============================================================================
-- UNI-VERSE SUPABASE SCHEMA
-- Complete database setup with tables, RLS policies, triggers, and seed data
-- ============================================================================

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================================
-- DROP EXISTING TABLES (for fresh setup)
-- ============================================================================

DROP TABLE IF EXISTS notifications CASCADE;
DROP TABLE IF EXISTS video_call_participants CASCADE;
DROP TABLE IF EXISTS video_calls CASCADE;
DROP TABLE IF EXISTS group_members CASCADE;
DROP TABLE IF EXISTS groups CASCADE;
DROP TABLE IF EXISTS message_reads CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS conversation_participants CASCADE;
DROP TABLE IF EXISTS conversations CASCADE;
DROP TABLE IF EXISTS story_views CASCADE;
DROP TABLE IF EXISTS story_slides CASCADE;
DROP TABLE IF EXISTS stories CASCADE;
DROP TABLE IF EXISTS comment_likes CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS post_bookmarks CASCADE;
DROP TABLE IF EXISTS post_likes CASCADE;
DROP TABLE IF EXISTS post_images CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS follows CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;
DROP TABLE IF EXISTS universities CASCADE;

-- ============================================================================
-- TABLES
-- ============================================================================

-- Universities (10 Ugandan universities)
CREATE TABLE universities (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  short_name TEXT NOT NULL,
  location TEXT NOT NULL,
  logo_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- User Profiles (extends Supabase auth.users)
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  username TEXT UNIQUE NOT NULL,
  email TEXT,
  avatar_url TEXT,
  cover_url TEXT,
  university_id UUID REFERENCES universities(id),
  course TEXT,
  year INTEGER CHECK (year >= 1 AND year <= 7),
  bio TEXT,
  is_verified BOOLEAN DEFAULT FALSE,
  is_online BOOLEAN DEFAULT FALSE,
  last_seen TIMESTAMPTZ DEFAULT NOW(),
  followers_count INTEGER DEFAULT 0,
  following_count INTEGER DEFAULT 0,
  posts_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Follows (follower/following relationships)
CREATE TABLE follows (
  follower_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  following_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (follower_id, following_id),
  CHECK (follower_id != following_id)
);

-- Groups
CREATE TABLE groups (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  university_id UUID REFERENCES universities(id),
  description TEXT,
  cover_image_url TEXT,
  category TEXT CHECK (category IN ('course', 'club', 'study-group', 'general')) DEFAULT 'general',
  member_count INTEGER DEFAULT 0,
  created_by UUID REFERENCES profiles(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Posts
CREATE TABLE posts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  author_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  content TEXT NOT NULL,
  type TEXT CHECK (type IN ('text', 'image', 'study-tip', 'question')) DEFAULT 'text',
  group_id UUID REFERENCES groups(id) ON DELETE SET NULL,
  likes_count INTEGER DEFAULT 0,
  comments_count INTEGER DEFAULT 0,
  shares_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Post Images
CREATE TABLE post_images (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  post_id UUID REFERENCES posts(id) ON DELETE CASCADE NOT NULL,
  image_url TEXT NOT NULL,
  order_index INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Post Likes
CREATE TABLE post_likes (
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  post_id UUID REFERENCES posts(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, post_id)
);

-- Post Bookmarks
CREATE TABLE post_bookmarks (
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  post_id UUID REFERENCES posts(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, post_id)
);

-- Comments
CREATE TABLE comments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  post_id UUID REFERENCES posts(id) ON DELETE CASCADE NOT NULL,
  author_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  content TEXT NOT NULL,
  likes_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Comment Likes
CREATE TABLE comment_likes (
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  comment_id UUID REFERENCES comments(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, comment_id)
);

-- Stories (24-hour expiring content)
CREATE TABLE stories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  author_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '24 hours')
);

-- Story Slides
CREATE TABLE story_slides (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  story_id UUID REFERENCES stories(id) ON DELETE CASCADE NOT NULL,
  image_url TEXT NOT NULL,
  caption TEXT,
  order_index INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Story Views
CREATE TABLE story_views (
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  story_id UUID REFERENCES stories(id) ON DELETE CASCADE,
  viewed_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, story_id)
);

-- Conversations (for messaging)
CREATE TABLE conversations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  is_group BOOLEAN DEFAULT FALSE,
  group_name TEXT,
  group_avatar_url TEXT,
  last_message_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Conversation Participants
CREATE TABLE conversation_participants (
  conversation_id UUID REFERENCES conversations(id) ON DELETE CASCADE,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  unread_count INTEGER DEFAULT 0,
  last_read_at TIMESTAMPTZ DEFAULT NOW(),
  joined_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (conversation_id, user_id)
);

-- Messages
CREATE TABLE messages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  conversation_id UUID REFERENCES conversations(id) ON DELETE CASCADE NOT NULL,
  sender_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  content TEXT,
  type TEXT CHECK (type IN ('text', 'image', 'file', 'voice')) DEFAULT 'text',
  file_url TEXT,
  reply_to_id UUID REFERENCES messages(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Message Read Status
CREATE TABLE message_reads (
  message_id UUID REFERENCES messages(id) ON DELETE CASCADE,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  read_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (message_id, user_id)
);

-- Group Members
CREATE TABLE group_members (
  group_id UUID REFERENCES groups(id) ON DELETE CASCADE,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  role TEXT CHECK (role IN ('admin', 'moderator', 'member')) DEFAULT 'member',
  joined_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (group_id, user_id)
);

-- Video Calls
CREATE TABLE video_calls (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  host_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  channel_name TEXT UNIQUE,
  scheduled_at TIMESTAMPTZ,
  status TEXT CHECK (status IN ('scheduled', 'live', 'ended')) DEFAULT 'scheduled',
  started_at TIMESTAMPTZ,
  ended_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Video Call Participants
CREATE TABLE video_call_participants (
  call_id UUID REFERENCES video_calls(id) ON DELETE CASCADE,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  joined_at TIMESTAMPTZ,
  left_at TIMESTAMPTZ,
  PRIMARY KEY (call_id, user_id)
);

-- Notifications
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  actor_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  type TEXT CHECK (type IN ('like', 'comment', 'follow', 'group-invite', 'mention', 'message')) NOT NULL,
  content TEXT,
  post_id UUID REFERENCES posts(id) ON DELETE CASCADE,
  comment_id UUID REFERENCES comments(id) ON DELETE CASCADE,
  group_id UUID REFERENCES groups(id) ON DELETE CASCADE,
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================================
-- INDEXES
-- ============================================================================

CREATE INDEX idx_profiles_username ON profiles(username);
CREATE INDEX idx_profiles_university ON profiles(university_id);
CREATE INDEX idx_posts_author ON posts(author_id);
CREATE INDEX idx_posts_group ON posts(group_id);
CREATE INDEX idx_posts_created_at ON posts(created_at DESC);
CREATE INDEX idx_comments_post ON comments(post_id);
CREATE INDEX idx_messages_conversation ON messages(conversation_id);
CREATE INDEX idx_messages_created_at ON messages(created_at DESC);
CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_notifications_unread ON notifications(user_id) WHERE is_read = FALSE;
CREATE INDEX idx_stories_author ON stories(author_id);
CREATE INDEX idx_stories_expires ON stories(expires_at);
CREATE INDEX idx_groups_university ON groups(university_id);
CREATE INDEX idx_groups_category ON groups(category);

-- ============================================================================
-- FUNCTIONS
-- ============================================================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to increment follower/following counts
CREATE OR REPLACE FUNCTION handle_follow()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE profiles SET following_count = following_count + 1 WHERE id = NEW.follower_id;
    UPDATE profiles SET followers_count = followers_count + 1 WHERE id = NEW.following_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE profiles SET following_count = following_count - 1 WHERE id = OLD.follower_id;
    UPDATE profiles SET followers_count = followers_count - 1 WHERE id = OLD.following_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Function to update post likes count
CREATE OR REPLACE FUNCTION handle_post_like()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE posts SET likes_count = likes_count + 1 WHERE id = NEW.post_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE posts SET likes_count = likes_count - 1 WHERE id = OLD.post_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Function to update post comments count
CREATE OR REPLACE FUNCTION handle_comment()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE posts SET comments_count = comments_count + 1 WHERE id = NEW.post_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE posts SET comments_count = comments_count - 1 WHERE id = OLD.post_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Function to update comment likes count
CREATE OR REPLACE FUNCTION handle_comment_like()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE comments SET likes_count = likes_count + 1 WHERE id = NEW.comment_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE comments SET likes_count = likes_count - 1 WHERE id = OLD.comment_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Function to update user posts count
CREATE OR REPLACE FUNCTION handle_user_post()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE profiles SET posts_count = posts_count + 1 WHERE id = NEW.author_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE profiles SET posts_count = posts_count - 1 WHERE id = OLD.author_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Function to update group member count
CREATE OR REPLACE FUNCTION handle_group_member()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    UPDATE groups SET member_count = member_count + 1 WHERE id = NEW.group_id;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE groups SET member_count = member_count - 1 WHERE id = OLD.group_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Function to update conversation last_message_at
CREATE OR REPLACE FUNCTION handle_new_message()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE conversations SET last_message_at = NOW(), updated_at = NOW() WHERE id = NEW.conversation_id;
  -- Increment unread count for other participants
  UPDATE conversation_participants
  SET unread_count = unread_count + 1
  WHERE conversation_id = NEW.conversation_id AND user_id != NEW.sender_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to create notification on follow
CREATE OR REPLACE FUNCTION create_follow_notification()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO notifications (user_id, actor_id, type, content)
  VALUES (NEW.following_id, NEW.follower_id, 'follow', 'started following you');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to create notification on like
CREATE OR REPLACE FUNCTION create_like_notification()
RETURNS TRIGGER AS $$
DECLARE
  post_author_id UUID;
BEGIN
  SELECT author_id INTO post_author_id FROM posts WHERE id = NEW.post_id;
  IF post_author_id != NEW.user_id THEN
    INSERT INTO notifications (user_id, actor_id, type, content, post_id)
    VALUES (post_author_id, NEW.user_id, 'like', 'liked your post', NEW.post_id);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Function to create notification on comment
CREATE OR REPLACE FUNCTION create_comment_notification()
RETURNS TRIGGER AS $$
DECLARE
  post_author_id UUID;
BEGIN
  SELECT author_id INTO post_author_id FROM posts WHERE id = NEW.post_id;
  IF post_author_id != NEW.author_id THEN
    INSERT INTO notifications (user_id, actor_id, type, content, post_id, comment_id)
    VALUES (post_author_id, NEW.author_id, 'comment', 'commented on your post', NEW.post_id, NEW.id);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- TRIGGERS
-- ============================================================================

-- Updated_at triggers
CREATE TRIGGER update_profiles_updated_at
  BEFORE UPDATE ON profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_posts_updated_at
  BEFORE UPDATE ON posts
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_groups_updated_at
  BEFORE UPDATE ON groups
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_conversations_updated_at
  BEFORE UPDATE ON conversations
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Follow triggers
CREATE TRIGGER on_follow
  AFTER INSERT OR DELETE ON follows
  FOR EACH ROW EXECUTE FUNCTION handle_follow();

CREATE TRIGGER on_follow_notification
  AFTER INSERT ON follows
  FOR EACH ROW EXECUTE FUNCTION create_follow_notification();

-- Post like triggers
CREATE TRIGGER on_post_like
  AFTER INSERT OR DELETE ON post_likes
  FOR EACH ROW EXECUTE FUNCTION handle_post_like();

CREATE TRIGGER on_like_notification
  AFTER INSERT ON post_likes
  FOR EACH ROW EXECUTE FUNCTION create_like_notification();

-- Comment triggers
CREATE TRIGGER on_comment
  AFTER INSERT OR DELETE ON comments
  FOR EACH ROW EXECUTE FUNCTION handle_comment();

CREATE TRIGGER on_comment_notification
  AFTER INSERT ON comments
  FOR EACH ROW EXECUTE FUNCTION create_comment_notification();

-- Comment like trigger
CREATE TRIGGER on_comment_like
  AFTER INSERT OR DELETE ON comment_likes
  FOR EACH ROW EXECUTE FUNCTION handle_comment_like();

-- User post trigger
CREATE TRIGGER on_user_post
  AFTER INSERT OR DELETE ON posts
  FOR EACH ROW EXECUTE FUNCTION handle_user_post();

-- Group member trigger
CREATE TRIGGER on_group_member
  AFTER INSERT OR DELETE ON group_members
  FOR EACH ROW EXECUTE FUNCTION handle_group_member();

-- Message trigger
CREATE TRIGGER on_new_message
  AFTER INSERT ON messages
  FOR EACH ROW EXECUTE FUNCTION handle_new_message();

-- ============================================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- ============================================================================

-- Enable RLS on all tables
ALTER TABLE universities ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE follows ENABLE ROW LEVEL SECURITY;
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE post_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE post_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE post_bookmarks ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE comment_likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE stories ENABLE ROW LEVEL SECURITY;
ALTER TABLE story_slides ENABLE ROW LEVEL SECURITY;
ALTER TABLE story_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE conversations ENABLE ROW LEVEL SECURITY;
ALTER TABLE conversation_participants ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE message_reads ENABLE ROW LEVEL SECURITY;
ALTER TABLE groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE group_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE video_calls ENABLE ROW LEVEL SECURITY;
ALTER TABLE video_call_participants ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

-- Universities: Everyone can read
CREATE POLICY "Universities are viewable by everyone" ON universities FOR SELECT USING (true);

-- Profiles: Public read, own write
CREATE POLICY "Profiles are viewable by everyone" ON profiles FOR SELECT USING (true);
CREATE POLICY "Users can update own profile" ON profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert own profile" ON profiles FOR INSERT WITH CHECK (auth.uid() = id);

-- Follows: Public read, own write
CREATE POLICY "Follows are viewable by everyone" ON follows FOR SELECT USING (true);
CREATE POLICY "Users can follow others" ON follows FOR INSERT WITH CHECK (auth.uid() = follower_id);
CREATE POLICY "Users can unfollow" ON follows FOR DELETE USING (auth.uid() = follower_id);

-- Posts: Public read, own write
CREATE POLICY "Posts are viewable by everyone" ON posts FOR SELECT USING (true);
CREATE POLICY "Users can create posts" ON posts FOR INSERT WITH CHECK (auth.uid() = author_id);
CREATE POLICY "Users can update own posts" ON posts FOR UPDATE USING (auth.uid() = author_id);
CREATE POLICY "Users can delete own posts" ON posts FOR DELETE USING (auth.uid() = author_id);

-- Post Images: Public read, own write
CREATE POLICY "Post images are viewable by everyone" ON post_images FOR SELECT USING (true);
CREATE POLICY "Users can add images to own posts" ON post_images FOR INSERT
  WITH CHECK (EXISTS (SELECT 1 FROM posts WHERE id = post_id AND author_id = auth.uid()));
CREATE POLICY "Users can delete images from own posts" ON post_images FOR DELETE
  USING (EXISTS (SELECT 1 FROM posts WHERE id = post_id AND author_id = auth.uid()));

-- Post Likes: Public read, own write
CREATE POLICY "Likes are viewable by everyone" ON post_likes FOR SELECT USING (true);
CREATE POLICY "Users can like posts" ON post_likes FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can unlike posts" ON post_likes FOR DELETE USING (auth.uid() = user_id);

-- Post Bookmarks: Own only
CREATE POLICY "Users can view own bookmarks" ON post_bookmarks FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can bookmark posts" ON post_bookmarks FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can remove bookmarks" ON post_bookmarks FOR DELETE USING (auth.uid() = user_id);

-- Comments: Public read, own write
CREATE POLICY "Comments are viewable by everyone" ON comments FOR SELECT USING (true);
CREATE POLICY "Users can create comments" ON comments FOR INSERT WITH CHECK (auth.uid() = author_id);
CREATE POLICY "Users can update own comments" ON comments FOR UPDATE USING (auth.uid() = author_id);
CREATE POLICY "Users can delete own comments" ON comments FOR DELETE USING (auth.uid() = author_id);

-- Comment Likes: Public read, own write
CREATE POLICY "Comment likes are viewable by everyone" ON comment_likes FOR SELECT USING (true);
CREATE POLICY "Users can like comments" ON comment_likes FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can unlike comments" ON comment_likes FOR DELETE USING (auth.uid() = user_id);

-- Stories: Public read, own write
CREATE POLICY "Active stories are viewable by everyone" ON stories
  FOR SELECT USING (expires_at > NOW());
CREATE POLICY "Users can create stories" ON stories FOR INSERT WITH CHECK (auth.uid() = author_id);
CREATE POLICY "Users can delete own stories" ON stories FOR DELETE USING (auth.uid() = author_id);

-- Story Slides: Public read, own write
CREATE POLICY "Story slides are viewable" ON story_slides FOR SELECT USING (true);
CREATE POLICY "Users can add slides to own stories" ON story_slides FOR INSERT
  WITH CHECK (EXISTS (SELECT 1 FROM stories WHERE id = story_id AND author_id = auth.uid()));

-- Story Views: Own views visible
CREATE POLICY "Story owners can see views" ON story_views FOR SELECT
  USING (EXISTS (SELECT 1 FROM stories WHERE id = story_id AND author_id = auth.uid()) OR user_id = auth.uid());
CREATE POLICY "Users can mark stories as viewed" ON story_views FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Conversations: Participants only
CREATE POLICY "Users can view own conversations" ON conversations FOR SELECT
  USING (EXISTS (SELECT 1 FROM conversation_participants WHERE conversation_id = id AND user_id = auth.uid()));
CREATE POLICY "Users can create conversations" ON conversations FOR INSERT WITH CHECK (true);
CREATE POLICY "Participants can update conversations" ON conversations FOR UPDATE
  USING (EXISTS (SELECT 1 FROM conversation_participants WHERE conversation_id = id AND user_id = auth.uid()));

-- Conversation Participants: Own visible
CREATE POLICY "Users can view conversation participants" ON conversation_participants FOR SELECT
  USING (EXISTS (SELECT 1 FROM conversation_participants cp WHERE cp.conversation_id = conversation_id AND cp.user_id = auth.uid()));
CREATE POLICY "Users can join conversations" ON conversation_participants FOR INSERT WITH CHECK (true);
CREATE POLICY "Users can update own participation" ON conversation_participants FOR UPDATE USING (user_id = auth.uid());
CREATE POLICY "Users can leave conversations" ON conversation_participants FOR DELETE USING (user_id = auth.uid());

-- Messages: Conversation participants only
CREATE POLICY "Users can view messages in their conversations" ON messages FOR SELECT
  USING (EXISTS (SELECT 1 FROM conversation_participants WHERE conversation_id = messages.conversation_id AND user_id = auth.uid()));
CREATE POLICY "Users can send messages" ON messages FOR INSERT
  WITH CHECK (auth.uid() = sender_id AND EXISTS (SELECT 1 FROM conversation_participants WHERE conversation_id = messages.conversation_id AND user_id = auth.uid()));
CREATE POLICY "Users can delete own messages" ON messages FOR DELETE USING (auth.uid() = sender_id);

-- Message Reads: Own only
CREATE POLICY "Users can view own read status" ON message_reads FOR SELECT USING (user_id = auth.uid());
CREATE POLICY "Users can mark messages as read" ON message_reads FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Groups: Public read, members write
CREATE POLICY "Groups are viewable by everyone" ON groups FOR SELECT USING (true);
CREATE POLICY "Users can create groups" ON groups FOR INSERT WITH CHECK (auth.uid() = created_by);
CREATE POLICY "Admins can update groups" ON groups FOR UPDATE
  USING (EXISTS (SELECT 1 FROM group_members WHERE group_id = id AND user_id = auth.uid() AND role = 'admin'));

-- Group Members: Public read, own write
CREATE POLICY "Group members are viewable" ON group_members FOR SELECT USING (true);
CREATE POLICY "Users can join groups" ON group_members FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can leave groups" ON group_members FOR DELETE USING (auth.uid() = user_id);
CREATE POLICY "Admins can update member roles" ON group_members FOR UPDATE
  USING (EXISTS (SELECT 1 FROM group_members gm WHERE gm.group_id = group_id AND gm.user_id = auth.uid() AND gm.role = 'admin'));

-- Video Calls: Participants only
CREATE POLICY "Video calls are viewable by participants" ON video_calls FOR SELECT
  USING (host_id = auth.uid() OR EXISTS (SELECT 1 FROM video_call_participants WHERE call_id = id AND user_id = auth.uid()));
CREATE POLICY "Users can create video calls" ON video_calls FOR INSERT WITH CHECK (auth.uid() = host_id);
CREATE POLICY "Hosts can update calls" ON video_calls FOR UPDATE USING (auth.uid() = host_id);

-- Video Call Participants: Viewable by participants
CREATE POLICY "Call participants are viewable" ON video_call_participants FOR SELECT
  USING (EXISTS (SELECT 1 FROM video_calls WHERE id = call_id AND (host_id = auth.uid() OR EXISTS (SELECT 1 FROM video_call_participants vcp WHERE vcp.call_id = call_id AND vcp.user_id = auth.uid()))));
CREATE POLICY "Users can join calls" ON video_call_participants FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own participation" ON video_call_participants FOR UPDATE USING (auth.uid() = user_id);

-- Notifications: Own only
CREATE POLICY "Users can view own notifications" ON notifications FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "System can create notifications" ON notifications FOR INSERT WITH CHECK (true);
CREATE POLICY "Users can update own notifications" ON notifications FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can delete own notifications" ON notifications FOR DELETE USING (auth.uid() = user_id);

-- ============================================================================
-- SEED DATA
-- ============================================================================

-- Insert Universities
INSERT INTO universities (id, name, short_name, location, logo_url) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Makerere University', 'MAK', 'Kampala', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/Makerere_University_seal.png/150px-Makerere_University_seal.png'),
  ('22222222-2222-2222-2222-222222222222', 'Kyambogo University', 'KYU', 'Kampala', NULL),
  ('33333333-3333-3333-3333-333333333333', 'Uganda Christian University', 'UCU', 'Mukono', NULL),
  ('44444444-4444-4444-4444-444444444444', 'Makerere University Business School', 'MUBS', 'Kampala', NULL),
  ('55555555-5555-5555-5555-555555555555', 'Gulu University', 'GU', 'Gulu', NULL),
  ('66666666-6666-6666-6666-666666666666', 'Mbarara University of Science & Technology', 'MUST', 'Mbarara', NULL),
  ('77777777-7777-7777-7777-777777777777', 'Busitema University', 'BU', 'Tororo', NULL),
  ('88888888-8888-8888-8888-888888888888', 'Uganda Martyrs University', 'UMU', 'Nkozi', NULL),
  ('99999999-9999-9999-9999-999999999999', 'Kabale University', 'KAB', 'Kabale', NULL),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Ndejje University', 'NDU', 'Luwero', NULL);

-- ============================================================================
-- STORAGE BUCKETS (run this in Supabase Dashboard > Storage)
-- ============================================================================

-- Note: Storage buckets must be created via Supabase Dashboard or API
-- Create the following buckets:
-- 1. avatars (public)
-- 2. post-images (public)
-- 3. story-images (public)
-- 4. message-attachments (private)
-- 5. group-covers (public)

-- ============================================================================
-- REALTIME SUBSCRIPTIONS
-- ============================================================================

-- Enable realtime for these tables (run in Supabase Dashboard > Database > Replication)
-- - messages
-- - notifications
-- - profiles (for online status)
-- - video_calls

-- To enable via SQL:
ALTER PUBLICATION supabase_realtime ADD TABLE messages;
ALTER PUBLICATION supabase_realtime ADD TABLE notifications;
ALTER PUBLICATION supabase_realtime ADD TABLE video_calls;
ALTER PUBLICATION supabase_realtime ADD TABLE conversation_participants;

-- ============================================================================
-- HELPER VIEWS
-- ============================================================================

-- View for posts with author info and like/bookmark status
CREATE OR REPLACE VIEW posts_with_details AS
SELECT
  p.*,
  row_to_json(pr.*) as author,
  row_to_json(u.*) as author_university,
  COALESCE(
    (SELECT json_agg(pi.image_url ORDER BY pi.order_index) FROM post_images pi WHERE pi.post_id = p.id),
    '[]'::json
  ) as images,
  EXISTS(SELECT 1 FROM post_likes pl WHERE pl.post_id = p.id AND pl.user_id = auth.uid()) as is_liked,
  EXISTS(SELECT 1 FROM post_bookmarks pb WHERE pb.post_id = p.id AND pb.user_id = auth.uid()) as is_bookmarked
FROM posts p
JOIN profiles pr ON p.author_id = pr.id
LEFT JOIN universities u ON pr.university_id = u.id;

-- View for conversations with last message and participants
CREATE OR REPLACE VIEW conversations_with_details AS
SELECT
  c.*,
  (
    SELECT row_to_json(m.*)
    FROM messages m
    WHERE m.conversation_id = c.id
    ORDER BY m.created_at DESC
    LIMIT 1
  ) as last_message,
  (
    SELECT json_agg(
      json_build_object(
        'user_id', cp.user_id,
        'unread_count', cp.unread_count,
        'profile', row_to_json(pr.*)
      )
    )
    FROM conversation_participants cp
    JOIN profiles pr ON cp.user_id = pr.id
    WHERE cp.conversation_id = c.id
  ) as participants
FROM conversations c;

-- ============================================================================
-- FUNCTIONS FOR COMMON OPERATIONS
-- ============================================================================

-- Function to get or create a direct conversation between two users
CREATE OR REPLACE FUNCTION get_or_create_conversation(other_user_id UUID)
RETURNS UUID AS $$
DECLARE
  conv_id UUID;
BEGIN
  -- Check if conversation exists
  SELECT c.id INTO conv_id
  FROM conversations c
  JOIN conversation_participants cp1 ON c.id = cp1.conversation_id
  JOIN conversation_participants cp2 ON c.id = cp2.conversation_id
  WHERE c.is_group = FALSE
    AND cp1.user_id = auth.uid()
    AND cp2.user_id = other_user_id;

  -- If not found, create new conversation
  IF conv_id IS NULL THEN
    INSERT INTO conversations (is_group) VALUES (FALSE) RETURNING id INTO conv_id;
    INSERT INTO conversation_participants (conversation_id, user_id) VALUES (conv_id, auth.uid());
    INSERT INTO conversation_participants (conversation_id, user_id) VALUES (conv_id, other_user_id);
  END IF;

  RETURN conv_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to mark all messages in a conversation as read
CREATE OR REPLACE FUNCTION mark_conversation_read(conv_id UUID)
RETURNS VOID AS $$
BEGIN
  -- Reset unread count
  UPDATE conversation_participants
  SET unread_count = 0, last_read_at = NOW()
  WHERE conversation_id = conv_id AND user_id = auth.uid();

  -- Mark messages as read
  INSERT INTO message_reads (message_id, user_id)
  SELECT m.id, auth.uid()
  FROM messages m
  WHERE m.conversation_id = conv_id
    AND m.sender_id != auth.uid()
    AND NOT EXISTS (SELECT 1 FROM message_reads mr WHERE mr.message_id = m.id AND mr.user_id = auth.uid())
  ON CONFLICT DO NOTHING;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to get feed posts (from following + own posts)
CREATE OR REPLACE FUNCTION get_feed_posts(page_limit INTEGER DEFAULT 20, page_offset INTEGER DEFAULT 0)
RETURNS TABLE (
  id UUID,
  author_id UUID,
  content TEXT,
  type TEXT,
  group_id UUID,
  likes_count INTEGER,
  comments_count INTEGER,
  shares_count INTEGER,
  created_at TIMESTAMPTZ,
  author JSON,
  images JSON,
  is_liked BOOLEAN,
  is_bookmarked BOOLEAN
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    p.id,
    p.author_id,
    p.content,
    p.type,
    p.group_id,
    p.likes_count,
    p.comments_count,
    p.shares_count,
    p.created_at,
    json_build_object(
      'id', pr.id,
      'name', pr.name,
      'username', pr.username,
      'avatar_url', pr.avatar_url,
      'is_verified', pr.is_verified,
      'university', json_build_object(
        'id', u.id,
        'name', u.name,
        'short_name', u.short_name
      )
    ) as author,
    COALESCE(
      (SELECT json_agg(pi.image_url ORDER BY pi.order_index) FROM post_images pi WHERE pi.post_id = p.id),
      '[]'::json
    ) as images,
    EXISTS(SELECT 1 FROM post_likes pl WHERE pl.post_id = p.id AND pl.user_id = auth.uid()) as is_liked,
    EXISTS(SELECT 1 FROM post_bookmarks pb WHERE pb.post_id = p.id AND pb.user_id = auth.uid()) as is_bookmarked
  FROM posts p
  JOIN profiles pr ON p.author_id = pr.id
  LEFT JOIN universities u ON pr.university_id = u.id
  WHERE p.author_id = auth.uid()
    OR p.author_id IN (SELECT following_id FROM follows WHERE follower_id = auth.uid())
  ORDER BY p.created_at DESC
  LIMIT page_limit
  OFFSET page_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================================
-- DONE!
-- ============================================================================

-- After running this script:
-- 1. Go to Supabase Dashboard > Storage and create buckets: avatars, post-images, story-images, message-attachments, group-covers
-- 2. Go to Database > Replication and enable realtime for: messages, notifications, video_calls
-- 3. Create demo users via Authentication > Users (the profile will be created when they sign up)
