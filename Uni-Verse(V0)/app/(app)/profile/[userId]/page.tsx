"use client"

import { use } from "react"
import Link from "next/link"
import { users, posts } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { UniversityBadge } from "@/components/universe/shared/university-badge"
import { PostCard } from "@/components/universe/feed/post-card"
import { Button } from "@/components/ui/button"
import { ArrowLeft, GraduationCap, MapPin, Calendar, MessageCircle } from "lucide-react"

export default function UserProfilePage({ params }: { params: Promise<{ userId: string }> }) {
  const { userId } = use(params)
  const user = users.find((u) => u.id === userId)

  if (!user) {
    return (
      <div className="flex h-[60vh] items-center justify-center">
        <p className="text-muted-foreground">User not found</p>
      </div>
    )
  }

  const userPosts = posts.filter((p) => p.author.id === user.id)

  return (
    <div className="mx-auto max-w-3xl">
      {/* Back button */}
      <div className="flex items-center gap-2 px-4 py-2 lg:pt-4">
        <Link href="/feed" className="rounded-full p-1.5 text-muted-foreground hover:bg-secondary" aria-label="Back">
          <ArrowLeft className="h-5 w-5" />
        </Link>
        <span className="text-sm font-medium text-foreground">{user.name}</span>
      </div>

      {/* Profile header */}
      <div className="border-b border-border bg-card">
        <div className="h-28 bg-gradient-to-r from-accent/20 via-primary/10 to-accent/20 md:h-40" />
        <div className="relative px-4 pb-4">
          <div className="-mt-12 flex items-end justify-between md:-mt-16">
            <UserAvatar
              src={user.avatar}
              name={user.name}
              size="xl"
              isOnline={user.isOnline}
              className="border-4 border-card h-24 w-24 md:h-32 md:w-32"
            />
            <div className="flex gap-2">
              <Button size="sm">Follow</Button>
              <Link href={`/messages/conv1`}>
                <Button variant="outline" size="icon" className="h-9 w-9" aria-label="Message">
                  <MessageCircle className="h-4 w-4" />
                </Button>
              </Link>
            </div>
          </div>

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
              <span className="flex items-center gap-1"><GraduationCap className="h-3.5 w-3.5" />{user.university.name}</span>
              <UniversityBadge shortName={user.university.shortName} />
              <span className="flex items-center gap-1"><MapPin className="h-3.5 w-3.5" />{user.university.location}</span>
              <span className="flex items-center gap-1"><Calendar className="h-3.5 w-3.5" />Year {user.year}, {user.course}</span>
            </div>
          </div>

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
      </div>

      {/* Posts */}
      <div className="flex flex-col">
        {userPosts.length > 0 ? (
          userPosts.map((post) => <PostCard key={post.id} post={post} />)
        ) : (
          <div className="py-16 text-center">
            <p className="text-sm text-muted-foreground">No posts yet</p>
          </div>
        )}
      </div>
    </div>
  )
}
