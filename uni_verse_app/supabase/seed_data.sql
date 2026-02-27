-- ============================================================================
-- UNI-VERSE SEED DATA
-- Run this AFTER creating auth users in Supabase Dashboard
-- ============================================================================

-- IMPORTANT: Before running this script, create these demo users in Supabase Auth:
-- 1. sarah@universe.app (password: Demo123!)   -> This will be the "current user" for testing
-- 2. amina@universe.app (password: Demo123!)
-- 3. brian@universe.app (password: Demo123!)
-- 4. christine@universe.app (password: Demo123!)
-- 5. david@universe.app (password: Demo123!)
-- 6. eva@universe.app (password: Demo123!)
-- 7. frank@universe.app (password: Demo123!)
-- 8. grace@universe.app (password: Demo123!)
-- 9. henry@universe.app (password: Demo123!)
-- 10. irene@universe.app (password: Demo123!)
-- 11. james@universe.app (password: Demo123!)
-- 12. karen@universe.app (password: Demo123!)
-- 13. liam@universe.app (password: Demo123!)

-- Then update the UUIDs below with the actual auth.users IDs from Supabase Dashboard

-- ============================================================================
-- DEMO USER PROFILES
-- Replace the UUIDs with actual auth.users IDs after creating users
-- ============================================================================

-- For testing purposes, using fixed UUIDs (replace with real auth user IDs)
DO $$
DECLARE
  sarah_id UUID := 'c0000000-0000-0000-0000-000000000001';
  amina_id UUID := 'c0000000-0000-0000-0000-000000000002';
  brian_id UUID := 'c0000000-0000-0000-0000-000000000003';
  christine_id UUID := 'c0000000-0000-0000-0000-000000000004';
  david_id UUID := 'c0000000-0000-0000-0000-000000000005';
  eva_id UUID := 'c0000000-0000-0000-0000-000000000006';
  frank_id UUID := 'c0000000-0000-0000-0000-000000000007';
  grace_id UUID := 'c0000000-0000-0000-0000-000000000008';
  henry_id UUID := 'c0000000-0000-0000-0000-000000000009';
  irene_id UUID := 'c0000000-0000-0000-0000-000000000010';
  james_id UUID := 'c0000000-0000-0000-0000-000000000011';
  karen_id UUID := 'c0000000-0000-0000-0000-000000000012';
  liam_id UUID := 'c0000000-0000-0000-0000-000000000013';

  -- University IDs (from schema.sql)
  mak_id UUID := '11111111-1111-1111-1111-111111111111';
  kyu_id UUID := '22222222-2222-2222-2222-222222222222';
  ucu_id UUID := '33333333-3333-3333-3333-333333333333';
  mubs_id UUID := '44444444-4444-4444-4444-444444444444';
  gulu_id UUID := '55555555-5555-5555-5555-555555555555';
  must_id UUID := '66666666-6666-6666-6666-666666666666';
  bu_id UUID := '77777777-7777-7777-7777-777777777777';
  umu_id UUID := '88888888-8888-8888-8888-888888888888';
  kab_id UUID := '99999999-9999-9999-9999-999999999999';
  ndu_id UUID := 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';

  -- Post IDs
  post1_id UUID := 'p0000000-0000-0000-0000-000000000001';
  post2_id UUID := 'p0000000-0000-0000-0000-000000000002';
  post3_id UUID := 'p0000000-0000-0000-0000-000000000003';
  post4_id UUID := 'p0000000-0000-0000-0000-000000000004';
  post5_id UUID := 'p0000000-0000-0000-0000-000000000005';
  post6_id UUID := 'p0000000-0000-0000-0000-000000000006';
  post7_id UUID := 'p0000000-0000-0000-0000-000000000007';
  post8_id UUID := 'p0000000-0000-0000-0000-000000000008';

  -- Group IDs
  group1_id UUID := 'g0000000-0000-0000-0000-000000000001';
  group2_id UUID := 'g0000000-0000-0000-0000-000000000002';
  group3_id UUID := 'g0000000-0000-0000-0000-000000000003';
  group4_id UUID := 'g0000000-0000-0000-0000-000000000004';
  group5_id UUID := 'g0000000-0000-0000-0000-000000000005';
  group6_id UUID := 'g0000000-0000-0000-0000-000000000006';

  -- Conversation IDs
  conv1_id UUID := 'cv000000-0000-0000-0000-000000000001';
  conv2_id UUID := 'cv000000-0000-0000-0000-000000000002';
  conv3_id UUID := 'cv000000-0000-0000-0000-000000000003';

  -- Story IDs
  story1_id UUID := 's0000000-0000-0000-0000-000000000001';
  story2_id UUID := 's0000000-0000-0000-0000-000000000002';
  story3_id UUID := 's0000000-0000-0000-0000-000000000003';

  -- Video Call IDs
  call1_id UUID := 'vc000000-0000-0000-0000-000000000001';
  call2_id UUID := 'vc000000-0000-0000-0000-000000000002';

BEGIN
  -- ============================================================================
  -- INSERT PROFILES
  -- ============================================================================

  -- Note: In production, profiles are created when users sign up
  -- This is just for demo/testing with mock auth

  INSERT INTO profiles (id, name, username, email, avatar_url, university_id, course, year, bio, is_verified, is_online, followers_count, following_count, posts_count) VALUES
    (sarah_id, 'Sarah Namukasa', 'sarah_nam', 'sarah@universe.app', 'https://i.pravatar.cc/150?img=44', mak_id, 'Software Engineering', 3, 'Full-stack developer. Open source contributor. Makerere CS ''26.', true, true, 1560, 420, 112),
    (amina_id, 'Amina Nakato', 'amina_nak', 'amina@universe.app', 'https://i.pravatar.cc/150?img=1', mak_id, 'Computer Science', 3, 'Code enthusiast. Building the future, one line at a time.', true, true, 1240, 380, 89),
    (brian_id, 'Brian Ouma', 'brian_ouma', 'brian@universe.app', 'https://i.pravatar.cc/150?img=3', kyu_id, 'Electrical Engineering', 2, 'Engineering the impossible.', false, true, 890, 210, 45),
    (christine_id, 'Christine Apio', 'christine_a', 'christine@universe.app', 'https://i.pravatar.cc/150?img=5', ucu_id, 'Law', 4, 'Future advocate. Justice for all.', true, false, 2100, 520, 134),
    (david_id, 'David Mugisha', 'dave_mug', 'david@universe.app', 'https://i.pravatar.cc/150?img=7', mubs_id, 'Business Administration', 3, 'Entrepreneur in the making. MUBS pride.', false, true, 650, 180, 67),
    (eva_id, 'Eva Nassali', 'eva_nass', 'eva@universe.app', 'https://i.pravatar.cc/150?img=9', mak_id, 'Medicine', 5, 'Saving lives, one patient at a time.', true, false, 3200, 890, 201),
    (frank_id, 'Frank Tumwine', 'frank_t', 'frank@universe.app', 'https://i.pravatar.cc/150?img=11', must_id, 'Pharmacy', 2, 'Science is my superpower.', false, true, 420, 150, 32),
    (grace_id, 'Grace Akello', 'grace_ak', 'grace@universe.app', 'https://i.pravatar.cc/150?img=10', gulu_id, 'Agriculture', 3, 'Feeding Uganda. Future farmer.', false, true, 780, 290, 56),
    (henry_id, 'Henry Ssemakula', 'henry_ss', 'henry@universe.app', 'https://i.pravatar.cc/150?img=12', bu_id, 'Civil Engineering', 4, 'Building bridges, literally.', false, false, 560, 170, 41),
    (irene_id, 'Irene Babirye', 'irene_bab', 'irene@universe.app', 'https://i.pravatar.cc/150?img=16', umu_id, 'Mass Communication', 2, 'Storyteller. Journalist in training.', false, true, 1890, 670, 178),
    (james_id, 'James Okiror', 'james_ok', 'james@universe.app', 'https://i.pravatar.cc/150?img=15', kab_id, 'Education', 3, 'Teaching the next generation.', false, false, 340, 120, 28),
    (karen_id, 'Karen Atim', 'karen_atim', 'karen@universe.app', 'https://i.pravatar.cc/150?img=20', ndu_id, 'Information Technology', 2, 'Tech girlie. UX enthusiast.', false, true, 1100, 340, 95),
    (liam_id, 'Liam Kizza', 'liam_k', 'liam@universe.app', 'https://i.pravatar.cc/150?img=13', mak_id, 'Architecture', 4, 'Designing spaces that inspire.', false, false, 920, 250, 73)
  ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    username = EXCLUDED.username,
    email = EXCLUDED.email,
    avatar_url = EXCLUDED.avatar_url,
    university_id = EXCLUDED.university_id,
    course = EXCLUDED.course,
    year = EXCLUDED.year,
    bio = EXCLUDED.bio,
    is_verified = EXCLUDED.is_verified;

  -- ============================================================================
  -- INSERT FOLLOWS
  -- ============================================================================

  INSERT INTO follows (follower_id, following_id) VALUES
    (sarah_id, amina_id),
    (sarah_id, christine_id),
    (sarah_id, eva_id),
    (sarah_id, karen_id),
    (amina_id, sarah_id),
    (amina_id, brian_id),
    (amina_id, karen_id),
    (brian_id, sarah_id),
    (brian_id, henry_id),
    (christine_id, sarah_id),
    (christine_id, eva_id),
    (david_id, sarah_id),
    (eva_id, sarah_id),
    (eva_id, frank_id),
    (karen_id, sarah_id),
    (karen_id, amina_id),
    (irene_id, sarah_id),
    (grace_id, sarah_id)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT GROUPS
  -- ============================================================================

  INSERT INTO groups (id, name, university_id, description, cover_image_url, category, member_count, created_by) VALUES
    (group1_id, 'CS Study Hub - Makerere', mak_id, 'A collaborative space for Computer Science students at MAK to share resources, ask questions, and help each other succeed.', 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800&h=300&fit=crop', 'course', 3, sarah_id),
    (group2_id, 'UCU Law Society', ucu_id, 'Official group for UCU Law students. Moot courts, debates, legal research, and networking opportunities.', 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=800&h=300&fit=crop', 'club', 1, christine_id),
    (group3_id, 'MUBS Entrepreneurs', mubs_id, 'For aspiring business leaders. Share startup ideas, business plans, and connect with mentors.', 'https://images.unsplash.com/photo-1556761175-4b46a572b786?w=800&h=300&fit=crop', 'club', 1, david_id),
    (group4_id, 'Inter-University Tech Network', mak_id, 'Connecting tech students across all Ugandan universities. Hackathons, workshops, and job opportunities.', 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800&h=300&fit=crop', 'general', 5, sarah_id),
    (group5_id, 'Medical Students Uganda', mak_id, 'A supportive community for medical students across all Ugandan universities. Study tips, resources, and mental health support.', 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&h=300&fit=crop', 'study-group', 2, eva_id),
    (group6_id, 'Gulu Agri-Research', gulu_id, 'Agricultural research discussions, field work coordination, and innovation sharing.', 'https://images.unsplash.com/photo-1500595046743-cd271d694d30?w=800&h=300&fit=crop', 'study-group', 1, grace_id)
  ON CONFLICT (id) DO NOTHING;

  -- ============================================================================
  -- INSERT GROUP MEMBERS
  -- ============================================================================

  INSERT INTO group_members (group_id, user_id, role) VALUES
    (group1_id, sarah_id, 'admin'),
    (group1_id, amina_id, 'member'),
    (group1_id, karen_id, 'member'),
    (group2_id, christine_id, 'admin'),
    (group3_id, david_id, 'admin'),
    (group4_id, sarah_id, 'admin'),
    (group4_id, amina_id, 'member'),
    (group4_id, brian_id, 'member'),
    (group4_id, karen_id, 'member'),
    (group4_id, henry_id, 'member'),
    (group5_id, eva_id, 'admin'),
    (group5_id, frank_id, 'member'),
    (group6_id, grace_id, 'admin')
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT POSTS
  -- ============================================================================

  INSERT INTO posts (id, author_id, content, type, likes_count, comments_count, shares_count) VALUES
    (post1_id, amina_id, 'Study Tip: When preparing for Data Structures exams, try implementing each structure from scratch. Understanding the internals makes MCQs so much easier! #StudyTips #CS', 'study-tip', 234, 2, 45),
    (post2_id, christine_id, 'Moot court competition at UCU was incredible! Our team made it to the finals. So proud of everyone who participated. The future of Uganda''s legal system is bright!', 'image', 567, 1, 89),
    (post3_id, david_id, 'Question for Business students: How do you approach case study analysis? I always struggle with the financial ratios section. Any frameworks or templates you use? Would love some help!', 'question', 145, 2, 23),
    (post4_id, eva_id, 'Anatomy lab was intense today! 12 hours of study but it is all worth it. Remember: the body keeps the score, so take breaks and stay hydrated, fellow med students!', 'image', 892, 1, 156),
    (post5_id, grace_id, 'Just finished planting our experimental maize field at Gulu University''s research farm. Comparing three different varieties for drought resistance. Science in action! Will share results next semester.', 'text', 312, 1, 67),
    (post6_id, irene_id, 'Behind the scenes of our documentary project at UMU. We are telling stories of local communities around Nkozi. Journalism is about giving voice to the voiceless.', 'image', 478, 2, 92),
    (post7_id, brian_id, 'Engineering Study Hack: Use simulation software (MATLAB, Proteus) alongside your textbook. Visual learning makes circuit analysis 10x easier. Free student licenses available!', 'study-tip', 201, 1, 38),
    (post8_id, karen_id, 'Excited to announce that our team from Ndejje won the Inter-University Hackathon! We built an app that helps farmers track crop diseases using AI. Innovation is alive in Ugandan universities!', 'text', 1203, 2, 234)
  ON CONFLICT (id) DO NOTHING;

  -- ============================================================================
  -- INSERT POST IMAGES
  -- ============================================================================

  INSERT INTO post_images (post_id, image_url, order_index) VALUES
    (post2_id, 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=600&h=400&fit=crop', 0),
    (post4_id, 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=600&h=400&fit=crop', 0),
    (post6_id, 'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=600&h=400&fit=crop', 0)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT COMMENTS
  -- ============================================================================

  INSERT INTO comments (post_id, author_id, content, likes_count) VALUES
    (post1_id, brian_id, 'This is gold! I spent hours on linked lists and it finally clicked.', 12),
    (post1_id, eva_id, 'Agreed. Also, draw diagrams for tree traversals.', 8),
    (post2_id, david_id, 'Congratulations! You all did amazing.', 23),
    (post3_id, irene_id, 'Try the SWOT + Porter''s Five Forces combo. Works every time.', 15),
    (post3_id, karen_id, 'I can share my notes! DM me.', 7),
    (post4_id, frank_id, 'Med school solidarity! You''ve got this.', 34),
    (post5_id, henry_id, 'This is the kind of research Uganda needs. Keep it up!', 18),
    (post6_id, james_id, 'Can''t wait to see the final product!', 9),
    (post6_id, amina_id, 'This is beautiful work. Storytelling matters.', 14),
    (post7_id, henry_id, 'Proteus saved my life during microprocessor coursework!', 11),
    (post8_id, amina_id, 'Congratulations! This is amazing. Would love to collaborate.', 45),
    (post8_id, david_id, 'Uganda''s tech scene is growing! Well done.', 29)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT POST LIKES (for Sarah)
  -- ============================================================================

  INSERT INTO post_likes (user_id, post_id) VALUES
    (sarah_id, post2_id),
    (sarah_id, post4_id),
    (sarah_id, post7_id),
    (sarah_id, post8_id)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT POST BOOKMARKS (for Sarah)
  -- ============================================================================

  INSERT INTO post_bookmarks (user_id, post_id) VALUES
    (sarah_id, post1_id),
    (sarah_id, post4_id),
    (sarah_id, post6_id),
    (sarah_id, post8_id)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT STORIES
  -- ============================================================================

  INSERT INTO stories (id, author_id, expires_at) VALUES
    (story1_id, sarah_id, NOW() + INTERVAL '20 hours'),
    (story2_id, amina_id, NOW() + INTERVAL '18 hours'),
    (story3_id, eva_id, NOW() + INTERVAL '22 hours')
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO story_slides (story_id, image_url, caption, order_index) VALUES
    (story1_id, 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400&h=700&fit=crop', 'Study session vibes', 0),
    (story2_id, 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=400&h=700&fit=crop', 'Coding marathon at MAK!', 0),
    (story2_id, 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=400&h=700&fit=crop', 'Team collaboration', 1),
    (story3_id, 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=400&h=700&fit=crop', 'Lab day!', 0)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT CONVERSATIONS
  -- ============================================================================

  INSERT INTO conversations (id, is_group, group_name) VALUES
    (conv1_id, false, NULL),
    (conv2_id, false, NULL),
    (conv3_id, true, 'Engineering Squad')
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO conversation_participants (conversation_id, user_id, unread_count) VALUES
    (conv1_id, sarah_id, 0),
    (conv1_id, amina_id, 0),
    (conv2_id, sarah_id, 0),
    (conv2_id, christine_id, 0),
    (conv3_id, sarah_id, 0),
    (conv3_id, brian_id, 0),
    (conv3_id, henry_id, 0)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT MESSAGES
  -- ============================================================================

  INSERT INTO messages (conversation_id, sender_id, content, type) VALUES
    (conv1_id, sarah_id, 'Hey Amina! How are you doing?', 'text'),
    (conv1_id, amina_id, 'Hi Sarah! I am great, just finished my algorithms assignment.', 'text'),
    (conv1_id, sarah_id, 'Nice! I am still struggling with the dynamic programming section.', 'text'),
    (conv1_id, amina_id, 'I can help you with that! Let us meet at the library tomorrow?', 'text'),
    (conv1_id, sarah_id, 'That would be amazing, thank you!', 'text'),
    (conv1_id, amina_id, 'Have you started the AI assignment?', 'text'),
    (conv2_id, christine_id, 'Hey Sarah! Thanks for the notes, they were really helpful.', 'text'),
    (conv2_id, sarah_id, 'No problem! Let me know if you need more.', 'text'),
    (conv3_id, brian_id, 'Team, have you seen the new lab schedule?', 'text'),
    (conv3_id, henry_id, 'Yes! Wednesday afternoons are going to be intense.', 'text'),
    (conv3_id, sarah_id, 'We should coordinate our project timeline', 'text'),
    (conv3_id, brian_id, 'Check out this circuit simulation I made', 'text')
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT VIDEO CALLS
  -- ============================================================================

  INSERT INTO video_calls (id, title, host_id, scheduled_at, status, channel_name) VALUES
    (call1_id, 'CS 301 - Study Group Session', amina_id, NOW() + INTERVAL '2 hours', 'scheduled', 'cs301-study'),
    (call2_id, 'Inter-Uni Hackathon Planning', sarah_id, NOW() - INTERVAL '30 minutes', 'live', 'hackathon-planning')
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO video_call_participants (call_id, user_id) VALUES
    (call1_id, amina_id),
    (call1_id, sarah_id),
    (call1_id, karen_id),
    (call1_id, liam_id),
    (call2_id, sarah_id),
    (call2_id, brian_id),
    (call2_id, david_id),
    (call2_id, henry_id),
    (call2_id, karen_id)
  ON CONFLICT DO NOTHING;

  -- ============================================================================
  -- INSERT NOTIFICATIONS (for Sarah)
  -- ============================================================================

  INSERT INTO notifications (user_id, actor_id, type, content, post_id, is_read) VALUES
    (sarah_id, amina_id, 'like', 'liked your post about software engineering', post8_id, false),
    (sarah_id, christine_id, 'comment', 'commented on your study tip', post1_id, false),
    (sarah_id, irene_id, 'follow', 'started following you', NULL, false),
    (sarah_id, david_id, 'group-invite', 'invited you to join MUBS Entrepreneurs', NULL, true),
    (sarah_id, karen_id, 'mention', 'mentioned you in a post about the hackathon', post8_id, true),
    (sarah_id, eva_id, 'like', 'liked your comment', NULL, true),
    (sarah_id, brian_id, 'comment', 'replied to your question about algorithms', post3_id, true),
    (sarah_id, grace_id, 'follow', 'started following you', NULL, true)
  ON CONFLICT DO NOTHING;

END $$;

-- ============================================================================
-- VERIFY DATA
-- ============================================================================

-- Check counts
SELECT 'profiles' as table_name, COUNT(*) as count FROM profiles
UNION ALL SELECT 'universities', COUNT(*) FROM universities
UNION ALL SELECT 'posts', COUNT(*) FROM posts
UNION ALL SELECT 'comments', COUNT(*) FROM comments
UNION ALL SELECT 'groups', COUNT(*) FROM groups
UNION ALL SELECT 'group_members', COUNT(*) FROM group_members
UNION ALL SELECT 'conversations', COUNT(*) FROM conversations
UNION ALL SELECT 'messages', COUNT(*) FROM messages
UNION ALL SELECT 'stories', COUNT(*) FROM stories
UNION ALL SELECT 'video_calls', COUNT(*) FROM video_calls
UNION ALL SELECT 'notifications', COUNT(*) FROM notifications
UNION ALL SELECT 'follows', COUNT(*) FROM follows;
