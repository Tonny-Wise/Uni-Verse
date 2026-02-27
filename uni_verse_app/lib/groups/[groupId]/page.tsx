"use client"

import { use } from "react"
import Link from "next/link"
import { groups } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { UniversityBadge } from "@/components/universe/shared/university-badge"
import { PostCard } from "@/components/universe/feed/post-card"
import { Button } from "@/components/ui/button"
import { ArrowLeft, Users, MapPin, Share2 } from "lucide-react"

export default function GroupPage({ params }: { params: Promise<{ groupId: string }> }) {
  const { groupId } = use(params)
  const group = groups.find((g) => g.id === groupId)

  if (!group) {
    return (
      <div className="flex h-[60vh] items-center justify-center">
        <p className="text-muted-foreground">Group not found</p>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-3xl">
      {/* Back button */}
      <div className="flex items-center gap-2 px-4 py-2 lg:pt-4">
        <Link href="/groups" className="rounded-full p-1.5 text-muted-foreground hover:bg-secondary" aria-label="Back">
          <ArrowLeft className="h-5 w-5" />
        </Link>
        <span className="text-sm font-medium text-muted-foreground">Groups</span>
      </div>

      {/* Cover image */}
      <div className="relative h-40 bg-muted md:h-52">
        <img src={group.coverImage} alt={group.name} className="h-full w-full object-cover" crossOrigin="anonymous" />
        <div className="absolute inset-0 bg-gradient-to-t from-foreground/50 to-transparent" />
      </div>

      {/* Group info */}
      <div className="border-b border-border bg-card px-4 py-4">
        <h1 className="text-xl font-bold text-foreground">{group.name}</h1>
        <div className="mt-2 flex flex-wrap items-center gap-3">
          <UniversityBadge shortName={group.university.shortName} />
          <span className="flex items-center gap-1 text-xs text-muted-foreground">
            <Users className="h-3.5 w-3.5" />
            {group.memberCount.toLocaleString()} members
          </span>
          <span className="flex items-center gap-1 text-xs text-muted-foreground">
            <MapPin className="h-3.5 w-3.5" />
            {group.university.location}
          </span>
        </div>
        <p className="mt-3 text-sm text-muted-foreground leading-relaxed">{group.description}</p>

        <div className="mt-4 flex items-center gap-3">
          <Button className="flex-1 sm:flex-none">
            {group.isJoined ? "Joined" : "Join Group"}
          </Button>
          <Button variant="outline" size="icon" aria-label="Share">
            <Share2 className="h-4 w-4" />
          </Button>
        </div>

        {/* Members preview */}
        <div className="mt-4 flex items-center gap-2">
          <div className="flex -space-x-2">
            {group.members.slice(0, 5).map((m) => (
              <UserAvatar key={m.id} src={m.avatar} name={m.name} size="sm" showStatus={false} className="border-2 border-card" />
            ))}
          </div>
          <span className="text-xs text-muted-foreground">
            {group.members.slice(0, 3).map(m => m.name.split(" ")[0]).join(", ")} and {group.memberCount - 3} others
          </span>
        </div>
      </div>

      {/* Group posts */}
      <div className="flex flex-col">
        {group.recentPosts.map((post) => (
          <PostCard key={post.id} post={post} />
        ))}
        {group.recentPosts.length === 0 && (
          <div className="py-16 text-center">
            <p className="text-muted-foreground text-sm">No posts yet. Be the first to share!</p>
          </div>
        )}
      </div>
    </div>
  )
}
