import type {
  University,
  User,
  Post,
  Story,
  Conversation,
  Message,
  Group,
  VideoCall,
  Notification,
} from "./types"

// ─── Universities ────────────────────────────────────────────────────────
export const universities: University[] = [
  { id: "mak", name: "Makerere University", shortName: "MAK", location: "Kampala", logo: "/universities/mak.png" },
  { id: "kyu", name: "Kyambogo University", shortName: "KYU", location: "Kampala", logo: "/universities/kyu.png" },
  { id: "ucu", name: "Uganda Christian University", shortName: "UCU", location: "Mukono", logo: "/universities/ucu.png" },
  { id: "mubs", name: "Makerere University Business School", shortName: "MUBS", location: "Kampala", logo: "/universities/mubs.png" },
  { id: "gulu", name: "Gulu University", shortName: "GU", location: "Gulu", logo: "/universities/gulu.png" },
  { id: "must", name: "Mbarara University of Science & Technology", shortName: "MUST", location: "Mbarara", logo: "/universities/must.png" },
  { id: "bus", name: "Busitema University", shortName: "BU", location: "Tororo", logo: "/universities/bus.png" },
  { id: "umu", name: "Uganda Martyrs University", shortName: "UMU", location: "Nkozi", logo: "/universities/umu.png" },
  { id: "kab", name: "Kabale University", shortName: "KAB", location: "Kabale", logo: "/universities/kab.png" },
  { id: "nde", name: "Ndejje University", shortName: "NDU", location: "Luwero", logo: "/universities/nde.png" },
]

// ─── Users ───────────────────────────────────────────────────────────────
export const users: User[] = [
  {
    id: "u1", name: "Amina Nakato", username: "amina_nak", avatar: "https://i.pravatar.cc/150?img=1",
    university: universities[0], course: "Computer Science", year: 3, bio: "Code enthusiast. Building the future, one line at a time.",
    followers: 1240, following: 380, posts: 89, isOnline: true, isVerified: true,
  },
  {
    id: "u2", name: "Brian Ouma", username: "brian_ouma", avatar: "https://i.pravatar.cc/150?img=3",
    university: universities[1], course: "Electrical Engineering", year: 2, bio: "Engineering the impossible.",
    followers: 890, following: 210, posts: 45, isOnline: true,
  },
  {
    id: "u3", name: "Christine Apio", username: "christine_a", avatar: "https://i.pravatar.cc/150?img=5",
    university: universities[2], course: "Law", year: 4, bio: "Future advocate. Justice for all.",
    followers: 2100, following: 520, posts: 134, isOnline: false, isVerified: true,
  },
  {
    id: "u4", name: "David Mugisha", username: "dave_mug", avatar: "https://i.pravatar.cc/150?img=7",
    university: universities[3], course: "Business Administration", year: 3, bio: "Entrepreneur in the making. MUBS pride.",
    followers: 650, following: 180, posts: 67, isOnline: true,
  },
  {
    id: "u5", name: "Eva Nassali", username: "eva_nass", avatar: "https://i.pravatar.cc/150?img=9",
    university: universities[0], course: "Medicine", year: 5, bio: "Saving lives, one patient at a time.",
    followers: 3200, following: 890, posts: 201, isOnline: false, isVerified: true,
  },
  {
    id: "u6", name: "Frank Tumwine", username: "frank_t", avatar: "https://i.pravatar.cc/150?img=11",
    university: universities[5], course: "Pharmacy", year: 2, bio: "Science is my superpower.",
    followers: 420, following: 150, posts: 32, isOnline: true,
  },
  {
    id: "u7", name: "Grace Akello", username: "grace_ak", avatar: "https://i.pravatar.cc/150?img=10",
    university: universities[4], course: "Agriculture", year: 3, bio: "Feeding Uganda. Future farmer.",
    followers: 780, following: 290, posts: 56, isOnline: true,
  },
  {
    id: "u8", name: "Henry Ssemakula", username: "henry_ss", avatar: "https://i.pravatar.cc/150?img=12",
    university: universities[6], course: "Civil Engineering", year: 4, bio: "Building bridges, literally.",
    followers: 560, following: 170, posts: 41, isOnline: false,
  },
  {
    id: "u9", name: "Irene Babirye", username: "irene_bab", avatar: "https://i.pravatar.cc/150?img=16",
    university: universities[7], course: "Mass Communication", year: 2, bio: "Storyteller. Journalist in training.",
    followers: 1890, following: 670, posts: 178, isOnline: true,
  },
  {
    id: "u10", name: "James Okiror", username: "james_ok", avatar: "https://i.pravatar.cc/150?img=15",
    university: universities[8], course: "Education", year: 3, bio: "Teaching the next generation.",
    followers: 340, following: 120, posts: 28, isOnline: false,
  },
  {
    id: "u11", name: "Karen Atim", username: "karen_atim", avatar: "https://i.pravatar.cc/150?img=20",
    university: universities[9], course: "Information Technology", year: 2, bio: "Tech girlie. UX enthusiast.",
    followers: 1100, following: 340, posts: 95, isOnline: true,
  },
  {
    id: "u12", name: "Liam Kizza", username: "liam_k", avatar: "https://i.pravatar.cc/150?img=13",
    university: universities[0], course: "Architecture", year: 4, bio: "Designing spaces that inspire.",
    followers: 920, following: 250, posts: 73, isOnline: false,
  },
]

export const currentUser: User = {
  id: "current",
  name: "Sarah Namukasa",
  username: "sarah_nam",
  avatar: "https://i.pravatar.cc/150?img=44",
  university: universities[0],
  course: "Software Engineering",
  year: 3,
  bio: "Full-stack developer. Open source contributor. Makerere CS '26.",
  followers: 1560,
  following: 420,
  posts: 112,
  isOnline: true,
  isVerified: true,
}

// ─── Posts ───────────────────────────────────────────────────────────────
export const posts: Post[] = [
  {
    id: "p1", author: users[0], type: "study-tip",
    content: "Study Tip: When preparing for Data Structures exams, try implementing each structure from scratch. Understanding the internals makes MCQs so much easier! #StudyTips #CS",
    images: [], likes: 234, comments: [
      { id: "c1", author: users[1], content: "This is gold! I spent hours on linked lists and it finally clicked.", createdAt: "2h ago", likes: 12 },
      { id: "c2", author: users[4], content: "Agreed. Also, draw diagrams for tree traversals.", createdAt: "1h ago", likes: 8 },
    ],
    shares: 45, createdAt: "3h ago", isLiked: false, isBookmarked: true,
  },
  {
    id: "p2", author: users[2], type: "image",
    content: "Moot court competition at UCU was incredible! Our team made it to the finals. So proud of everyone who participated. The future of Uganda's legal system is bright!",
    images: ["https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=600&h=400&fit=crop"],
    likes: 567, comments: [
      { id: "c3", author: users[3], content: "Congratulations! You all did amazing.", createdAt: "5h ago", likes: 23 },
    ],
    shares: 89, createdAt: "6h ago", isLiked: true, isBookmarked: false,
  },
  {
    id: "p3", author: users[3], type: "question",
    content: "Question for Business students: How do you approach case study analysis? I always struggle with the financial ratios section. Any frameworks or templates you use? Would love some help!",
    images: [], likes: 145, comments: [
      { id: "c4", author: users[8], content: "Try the SWOT + Porter's Five Forces combo. Works every time.", createdAt: "4h ago", likes: 15 },
      { id: "c5", author: users[10], content: "I can share my notes! DM me.", createdAt: "3h ago", likes: 7 },
    ],
    shares: 23, createdAt: "8h ago", isLiked: false, isBookmarked: false,
  },
  {
    id: "p4", author: users[4], type: "image",
    content: "Anatomy lab was intense today! 12 hours of study but it is all worth it. Remember: the body keeps the score, so take breaks and stay hydrated, fellow med students!",
    images: ["https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=600&h=400&fit=crop"],
    likes: 892, comments: [
      { id: "c6", author: users[5], content: "Med school solidarity! You've got this.", createdAt: "2h ago", likes: 34 },
    ],
    shares: 156, createdAt: "10h ago", isLiked: true, isBookmarked: true,
  },
  {
    id: "p5", author: users[6], type: "text",
    content: "Just finished planting our experimental maize field at Gulu University's research farm. Comparing three different varieties for drought resistance. Science in action! Will share results next semester.",
    images: [], likes: 312, comments: [
      { id: "c7", author: users[7], content: "This is the kind of research Uganda needs. Keep it up!", createdAt: "1h ago", likes: 18 },
    ],
    shares: 67, createdAt: "12h ago", isLiked: false, isBookmarked: false,
  },
  {
    id: "p6", author: users[8], type: "image",
    content: "Behind the scenes of our documentary project at UMU. We are telling stories of local communities around Nkozi. Journalism is about giving voice to the voiceless.",
    images: ["https://images.unsplash.com/photo-1485846234645-a62644f84728?w=600&h=400&fit=crop"],
    likes: 478, comments: [
      { id: "c8", author: users[9], content: "Can't wait to see the final product!", createdAt: "6h ago", likes: 9 },
      { id: "c9", author: users[0], content: "This is beautiful work. Storytelling matters.", createdAt: "5h ago", likes: 14 },
    ],
    shares: 92, createdAt: "1d ago", isLiked: false, isBookmarked: true,
  },
  {
    id: "p7", author: users[1], type: "study-tip",
    content: "Engineering Study Hack: Use simulation software (MATLAB, Proteus) alongside your textbook. Visual learning makes circuit analysis 10x easier. Free student licenses available!",
    images: [], likes: 201, comments: [
      { id: "c10", author: users[7], content: "Proteus saved my life during microprocessor coursework!", createdAt: "3h ago", likes: 11 },
    ],
    shares: 38, createdAt: "1d ago", isLiked: true, isBookmarked: false,
  },
  {
    id: "p8", author: users[10], type: "text",
    content: "Excited to announce that our team from Ndejje won the Inter-University Hackathon! We built an app that helps farmers track crop diseases using AI. Innovation is alive in Ugandan universities!",
    images: [], likes: 1203, comments: [
      { id: "c11", author: users[0], content: "Congratulations! This is amazing. Would love to collaborate.", createdAt: "8h ago", likes: 45 },
      { id: "c12", author: users[3], content: "Uganda's tech scene is growing! Well done.", createdAt: "7h ago", likes: 29 },
    ],
    shares: 234, createdAt: "2d ago", isLiked: true, isBookmarked: true,
  },
]

// ─── Stories ─────────────────────────────────────────────────────────────
export const stories: Story[] = [
  {
    id: "s1", author: currentUser, viewed: false,
    slides: [{ id: "sl1", image: "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400&h=700&fit=crop", caption: "Study session vibes", createdAt: "1h ago" }],
  },
  {
    id: "s2", author: users[0], viewed: false,
    slides: [
      { id: "sl2", image: "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=400&h=700&fit=crop", caption: "Coding marathon at MAK!", createdAt: "2h ago" },
      { id: "sl3", image: "https://images.unsplash.com/photo-1531482615713-2afd69097998?w=400&h=700&fit=crop", caption: "Team collaboration", createdAt: "1h ago" },
    ],
  },
  {
    id: "s3", author: users[2], viewed: true,
    slides: [{ id: "sl4", image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=700&fit=crop", caption: "UCU campus life", createdAt: "4h ago" }],
  },
  {
    id: "s4", author: users[4], viewed: false,
    slides: [{ id: "sl5", image: "https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=400&h=700&fit=crop", caption: "Lab day!", createdAt: "3h ago" }],
  },
  {
    id: "s5", author: users[6], viewed: true,
    slides: [{ id: "sl6", image: "https://images.unsplash.com/photo-1500595046743-cd271d694d30?w=400&h=700&fit=crop", caption: "Farm research day", createdAt: "5h ago" }],
  },
  {
    id: "s6", author: users[8], viewed: false,
    slides: [{ id: "sl7", image: "https://images.unsplash.com/photo-1492691527719-9d1e07e534b4?w=400&h=700&fit=crop", caption: "Documentary filming", createdAt: "2h ago" }],
  },
  {
    id: "s7", author: users[1], viewed: false,
    slides: [{ id: "sl8", image: "https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=400&h=700&fit=crop", caption: "Engineering project", createdAt: "6h ago" }],
  },
  {
    id: "s8", author: users[10], viewed: true,
    slides: [{ id: "sl9", image: "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?w=400&h=700&fit=crop", caption: "Hackathon prep", createdAt: "4h ago" }],
  },
]

// ─── Conversations ───────────────────────────────────────────────────────
const msgBase = (id: string, senderId: string, content: string, read: boolean): Message => ({
  id, senderId, content, createdAt: "", type: "text", read,
})

export const conversations: Conversation[] = [
  {
    id: "conv1", participants: [currentUser, users[0]], isGroup: false, unreadCount: 3,
    lastMessage: { ...msgBase("m1", users[0].id, "Have you started the AI assignment?", false), createdAt: "2m ago" },
  },
  {
    id: "conv2", participants: [currentUser, users[2]], isGroup: false, unreadCount: 0,
    lastMessage: { ...msgBase("m2", currentUser.id, "Thanks for the notes! Really helpful.", true), createdAt: "1h ago" },
  },
  {
    id: "conv3", participants: [currentUser, users[1], users[7]], isGroup: true, groupName: "Engineering Squad", unreadCount: 12,
    lastMessage: { ...msgBase("m3", users[1].id, "Check out this circuit simulation I made", false), createdAt: "15m ago" },
  },
  {
    id: "conv4", participants: [currentUser, users[3]], isGroup: false, unreadCount: 0,
    lastMessage: { ...msgBase("m4", users[3].id, "See you at the entrepreneurship meetup!", true), createdAt: "3h ago" },
  },
  {
    id: "conv5", participants: [currentUser, users[4], users[5]], isGroup: true, groupName: "Med & Pharma Study", unreadCount: 5,
    lastMessage: { ...msgBase("m5", users[4].id, "Pharmacology notes uploaded to the drive", false), createdAt: "30m ago" },
  },
  {
    id: "conv6", participants: [currentUser, users[8]], isGroup: false, unreadCount: 1,
    lastMessage: { ...msgBase("m6", users[8].id, "Would love to interview you for the campus paper!", false), createdAt: "45m ago" },
  },
  {
    id: "conv7", participants: [currentUser, users[10]], isGroup: false, unreadCount: 0,
    lastMessage: { ...msgBase("m7", currentUser.id, "The hackathon project looks amazing, congrats!", true), createdAt: "2h ago" },
  },
]

export const chatMessages: Record<string, Message[]> = {
  conv1: [
    { id: "m1a", senderId: currentUser.id, content: "Hey Amina! How are you doing?", createdAt: "10:00 AM", type: "text", read: true },
    { id: "m1b", senderId: users[0].id, content: "Hi Sarah! I am great, just finished my algorithms assignment.", createdAt: "10:05 AM", type: "text", read: true },
    { id: "m1c", senderId: currentUser.id, content: "Nice! I am still struggling with the dynamic programming section.", createdAt: "10:07 AM", type: "text", read: true },
    { id: "m1d", senderId: users[0].id, content: "I can help you with that! Let us meet at the library tomorrow?", createdAt: "10:10 AM", type: "text", read: true },
    { id: "m1e", senderId: currentUser.id, content: "That would be amazing, thank you!", createdAt: "10:12 AM", type: "text", read: true },
    { id: "m1f", senderId: users[0].id, content: "Have you started the AI assignment?", createdAt: "10:30 AM", type: "text", read: false },
  ],
  conv3: [
    { id: "m3a", senderId: users[1].id, content: "Team, have you seen the new lab schedule?", createdAt: "9:00 AM", type: "text", read: true },
    { id: "m3b", senderId: users[7].id, content: "Yes! Wednesday afternoons are going to be intense.", createdAt: "9:15 AM", type: "text", read: true },
    { id: "m3c", senderId: currentUser.id, content: "We should coordinate our project timeline", createdAt: "9:20 AM", type: "text", read: true },
    { id: "m3d", senderId: users[1].id, content: "Check out this circuit simulation I made", createdAt: "9:45 AM", type: "text", read: false },
  ],
}

// ─── Groups ──────────────────────────────────────────────────────────────
export const groups: Group[] = [
  {
    id: "g1", name: "CS Study Hub - Makerere", university: universities[0],
    description: "A collaborative space for Computer Science students at MAK to share resources, ask questions, and help each other succeed.",
    memberCount: 1250, members: [currentUser, users[0], users[10]], isJoined: true,
    coverImage: "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800&h=300&fit=crop",
    category: "course", recentPosts: [posts[0]],
  },
  {
    id: "g2", name: "UCU Law Society", university: universities[2],
    description: "Official group for UCU Law students. Moot courts, debates, legal research, and networking opportunities.",
    memberCount: 890, members: [users[2]], isJoined: false,
    coverImage: "https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=800&h=300&fit=crop",
    category: "club", recentPosts: [posts[1]],
  },
  {
    id: "g3", name: "MUBS Entrepreneurs", university: universities[3],
    description: "For aspiring business leaders. Share startup ideas, business plans, and connect with mentors.",
    memberCount: 2100, members: [users[3]], isJoined: false,
    coverImage: "https://images.unsplash.com/photo-1556761175-4b46a572b786?w=800&h=300&fit=crop",
    category: "club", recentPosts: [posts[2]],
  },
  {
    id: "g4", name: "Inter-University Tech Network", university: universities[0],
    description: "Connecting tech students across all Ugandan universities. Hackathons, workshops, and job opportunities.",
    memberCount: 5400, members: [currentUser, users[0], users[1], users[10], users[7]], isJoined: true,
    coverImage: "https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800&h=300&fit=crop",
    category: "general", recentPosts: [posts[7]],
  },
  {
    id: "g5", name: "Medical Students Uganda", university: universities[0],
    description: "A supportive community for medical students across all Ugandan universities. Study tips, resources, and mental health support.",
    memberCount: 3200, members: [users[4], users[5]], isJoined: false,
    coverImage: "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&h=300&fit=crop",
    category: "study-group", recentPosts: [posts[3]],
  },
  {
    id: "g6", name: "Gulu Agri-Research", university: universities[4],
    description: "Agricultural research discussions, field work coordination, and innovation sharing.",
    memberCount: 450, members: [users[6]], isJoined: false,
    coverImage: "https://images.unsplash.com/photo-1500595046743-cd271d694d30?w=800&h=300&fit=crop",
    category: "study-group", recentPosts: [posts[4]],
  },
]

// ─── Video Calls ─────────────────────────────────────────────────────────
export const videoCalls: VideoCall[] = [
  {
    id: "vc1", title: "CS 301 - Study Group Session", host: users[0],
    participants: [currentUser, users[0], users[10], users[11]],
    scheduledAt: "Today, 4:00 PM", status: "scheduled",
  },
  {
    id: "vc2", title: "Inter-Uni Hackathon Planning", host: currentUser,
    participants: [currentUser, users[1], users[3], users[7], users[10]],
    scheduledAt: "Live now", status: "live", duration: "45:23",
  },
  {
    id: "vc3", title: "Medical Ethics Discussion", host: users[4],
    participants: [users[4], users[5]],
    scheduledAt: "Tomorrow, 2:00 PM", status: "scheduled",
  },
  {
    id: "vc4", title: "Engineering Project Review", host: users[1],
    participants: [users[1], users[7], currentUser],
    scheduledAt: "Yesterday", status: "ended", duration: "1:23:45",
  },
]

// ─── Notifications ───────────────────────────────────────────────────────
export const notifications: Notification[] = [
  { id: "n1", type: "like", actor: users[0], content: "liked your post about software engineering", createdAt: "2m ago", read: false },
  { id: "n2", type: "comment", actor: users[2], content: "commented on your study tip", createdAt: "15m ago", read: false },
  { id: "n3", type: "follow", actor: users[8], content: "started following you", createdAt: "1h ago", read: false },
  { id: "n4", type: "group-invite", actor: users[3], content: "invited you to join MUBS Entrepreneurs", createdAt: "2h ago", read: true, groupId: "g3" },
  { id: "n5", type: "mention", actor: users[10], content: "mentioned you in a post about the hackathon", createdAt: "3h ago", read: true, postId: "p8" },
  { id: "n6", type: "like", actor: users[4], content: "liked your comment", createdAt: "5h ago", read: true },
  { id: "n7", type: "comment", actor: users[1], content: "replied to your question about algorithms", createdAt: "6h ago", read: true },
  { id: "n8", type: "follow", actor: users[6], content: "started following you", createdAt: "1d ago", read: true },
  { id: "n9", type: "group-invite", actor: users[0], content: "invited you to CS Study Hub - Makerere", createdAt: "1d ago", read: true, groupId: "g1" },
  { id: "n10", type: "like", actor: users[11], content: "liked your photo", createdAt: "2d ago", read: true },
]

// ─── Trending topics ─────────────────────────────────────────────────────
export const trendingTopics = [
  { tag: "#ExamSeason", posts: 1240 },
  { tag: "#MakerereLife", posts: 890 },
  { tag: "#UgandaTech", posts: 2300 },
  { tag: "#StudyTips", posts: 3400 },
  { tag: "#CampusVibes", posts: 1567 },
  { tag: "#InterUniHackathon", posts: 780 },
]
