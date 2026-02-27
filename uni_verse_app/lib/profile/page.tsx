"use client"

import { useState } from "react"
import { useAuth } from "@/lib/auth-context"
import { posts } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { UniversityBadge } from "@/components/universe/shared/university-badge"
import { PostCard } from "@/components/universe/feed/post-card"
import { Button } from "@/components/ui/button"
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Textarea } from "@/components/ui/textarea"
import { Settings, Grid3X3, Bookmark, GraduationCap, MapPin, Calendar, Edit } from "lucide-react"
import { cn } from "@/lib/utils"
import Link from "next/link"

const profileTabs = [
  { id: "posts", label: "Posts", icon: Grid3X3 },
  { id: "saved", label: "Saved", icon: Bookmark },
]

export default function ProfilePage() {
  const { user } = useAuth()
  const [activeTab, setActiveTab] = useState("posts")

  if (!user) return null

  const userPosts = posts.slice(0, 4)

  return (
    <div className="mx-auto max-w-3xl">
      {/* Profile header */}
      <div className="border-b border-border bg-card">
        {/* Cover area */}
        <div className="h-28 bg-gradient-to-r from-primary/20 via-accent/10 to-primary/20 md:h-40" />

        <div className="relative px-4 pb-4">
          {/* Avatar */}
          <div className="-mt-12 flex items-end justify-between md:-mt-16">
            <UserAvatar
              src={user.avatar}
              name={user.name}
              size="xl"
              isOnline
              className="border-4 border-card h-24 w-24 md:h-32 md:w-32"
            />
            <div className="flex gap-2">
              <EditProfileDialog user={user} />
              <Link href="/settings">
                <Button variant="outline" size="icon" className="h-9 w-9" aria-label="Settings">
                  <Settings className="h-4 w-4" />
                </Button>
              </Link>
            </div>
          </div>

          {/* User info */}
          <div className="mt-3">
            <div className="flex items-center gap-2">
              <h1 className="text-xl font-bold text-foreground">{user.name}</h1>
              {user.isVerified && (
                <span className="flex h-5 w-5 items-center justify-center rounded-full bg-primary" aria-label="Verified">
                  <svg className="h-3 w-3 text-primary-foreground" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><path d="M20 6 9 17l-5-5"/></svg>
                </span>
              )}
            </div>
            <p className="text-sm text-muted-foreground">@{user.username}</p>
            <p className="mt-2 text-sm text-foreground leading-relaxed">{user.bio}</p>

            <div className="mt-3 flex flex-wrap items-center gap-3 text-xs text-muted-foreground">
              <span className="flex items-center gap-1">
                <GraduationCap className="h-3.5 w-3.5" />
                {user.university.name}
              </span>
              <UniversityBadge shortName={user.university.shortName} />
              <span className="flex items-center gap-1">
                <MapPin className="h-3.5 w-3.5" />
                {user.university.location}
              </span>
              <span className="flex items-center gap-1">
                <Calendar className="h-3.5 w-3.5" />
                Year {user.year}, {user.course}
              </span>
            </div>
          </div>

          {/* Stats */}
          <div className="mt-4 flex gap-6">
            <div className="text-center">
              <p className="text-lg font-bold text-foreground">{user.posts}</p>
              <p className="text-xs text-muted-foreground">Posts</p>
            </div>
            <div className="text-center">
              <p className="text-lg font-bold text-foreground">{user.followers.toLocaleString()}</p>
              <p className="text-xs text-muted-foreground">Followers</p>
            </div>
            <div className="text-center">
              <p className="text-lg font-bold text-foreground">{user.following}</p>
              <p className="text-xs text-muted-foreground">Following</p>
            </div>
          </div>
        </div>

        {/* Tabs */}
        <div className="flex border-t border-border">
          {profileTabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={cn(
                "flex flex-1 items-center justify-center gap-2 py-3 text-sm font-medium transition-colors relative",
                activeTab === tab.id ? "text-primary" : "text-muted-foreground hover:text-foreground"
              )}
            >
              <tab.icon className="h-4 w-4" />
              {tab.label}
              {activeTab === tab.id && (
                <span className="absolute bottom-0 left-1/4 right-1/4 h-0.5 rounded-full bg-primary" />
              )}
            </button>
          ))}
        </div>
      </div>

      {/* Posts */}
      {activeTab === "posts" && (
        <div className="flex flex-col">
          {userPosts.map((post) => (
            <PostCard key={post.id} post={post} />
          ))}
        </div>
      )}

      {activeTab === "saved" && (
        <div className="py-16 text-center">
          <Bookmark className="mx-auto h-12 w-12 text-muted-foreground/40" />
          <p className="mt-3 text-sm text-muted-foreground">Saved posts will appear here</p>
        </div>
      )}
    </div>
  )
}

function EditProfileDialog({ user }: { user: NonNullable<ReturnType<typeof useAuth>["user"]> }) {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button variant="outline" size="sm" className="gap-1.5">
          <Edit className="h-3.5 w-3.5" />
          Edit Profile
        </Button>
      </DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Edit Profile</DialogTitle>
          <DialogDescription className="sr-only">Update your profile details including name, username, bio, and course</DialogDescription>
        </DialogHeader>
        <div className="flex flex-col gap-4 pt-2">
          <div className="flex items-center gap-4">
            <UserAvatar src={user.avatar} name={user.name} size="lg" showStatus={false} />
            <Button variant="outline" size="sm">Change Photo</Button>
          </div>
          <div className="flex flex-col gap-2">
            <Label htmlFor="edit-name">Name</Label>
            <Input id="edit-name" defaultValue={user.name} />
          </div>
          <div className="flex flex-col gap-2">
            <Label htmlFor="edit-username">Username</Label>
            <Input id="edit-username" defaultValue={user.username} />
          </div>
          <div className="flex flex-col gap-2">
            <Label htmlFor="edit-bio">Bio</Label>
            <Textarea id="edit-bio" defaultValue={user.bio} rows={3} className="resize-none" />
          </div>
          <div className="flex flex-col gap-2">
            <Label htmlFor="edit-course">Course</Label>
            <Input id="edit-course" defaultValue={user.course} />
          </div>
          <Button>Save Changes</Button>
        </div>
      </DialogContent>
    </Dialog>
  )
}
