export interface University {
  id: string
  name: string
  shortName: string
  location: string
  logo: string
}

export interface User {
  id: string
  name: string
  username: string
  avatar: string
  university: University
  course: string
  year: number
  bio: string
  followers: number
  following: number
  posts: number
  isOnline: boolean
  isVerified?: boolean
}

export type PostType = "text" | "image" | "study-tip" | "question"

export interface Post {
  id: string
  author: User
  content: string
  images: string[]
  likes: number
  comments: Comment[]
  shares: number
  createdAt: string
  type: PostType
  isLiked: boolean
  isBookmarked: boolean
  group?: { id: string; name: string }
}

export interface Comment {
  id: string
  author: User
  content: string
  createdAt: string
  likes: number
}

export interface Story {
  id: string
  author: User
  slides: StorySlide[]
  viewed: boolean
}

export interface StorySlide {
  id: string
  image: string
  caption?: string
  createdAt: string
}

export interface Message {
  id: string
  senderId: string
  content: string
  createdAt: string
  type: "text" | "image" | "file" | "voice"
  read: boolean
  replyTo?: string
}

export interface Conversation {
  id: string
  participants: User[]
  lastMessage: Message
  unreadCount: number
  isGroup: boolean
  groupName?: string
  groupAvatar?: string
}

export interface Group {
  id: string
  name: string
  university: University
  description: string
  memberCount: number
  members: User[]
  coverImage: string
  category: "course" | "club" | "study-group" | "general"
  isJoined: boolean
  recentPosts: Post[]
}

export interface VideoCall {
  id: string
  title: string
  host: User
  participants: User[]
  scheduledAt: string
  status: "scheduled" | "live" | "ended"
  duration?: string
}

export interface Notification {
  id: string
  type: "like" | "comment" | "follow" | "group-invite" | "mention" | "message"
  actor: User
  content: string
  createdAt: string
  read: boolean
  postId?: string
  groupId?: string
}
