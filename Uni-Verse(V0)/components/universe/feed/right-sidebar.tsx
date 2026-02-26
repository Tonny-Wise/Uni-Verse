"use client"

import Link from "next/link"
import { users, trendingTopics } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { UniversityBadge } from "@/components/universe/shared/university-badge"
import { Button } from "@/components/ui/button"
import { TrendingUp } from "lucide-react"

export function RightSidebar() {
  const suggestedUsers = users.slice(0, 4)

  return (
    <aside className="hidden xl:block xl:w-[320px] xl:shrink-0">
      <div className="sticky top-0 flex flex-col gap-5 px-4 py-4">
        {/* Trending */}
        <div className="rounded-xl border border-border bg-card p-4">
          <div className="mb-3 flex items-center gap-2">
            <TrendingUp className="h-4 w-4 text-primary" />
            <h3 className="text-sm font-semibold text-foreground">Trending Now</h3>
          </div>
          <div className="flex flex-col gap-2.5">
            {trendingTopics.slice(0, 5).map((topic) => (
              <div key={topic.tag} className="flex items-center justify-between">
                <span className="text-sm font-medium text-primary">{topic.tag}</span>
                <span className="text-xs text-muted-foreground">{topic.posts.toLocaleString()} posts</span>
              </div>
            ))}
          </div>
        </div>

        {/* Suggested connections */}
        <div className="rounded-xl border border-border bg-card p-4">
          <h3 className="mb-3 text-sm font-semibold text-foreground">Suggested for you</h3>
          <div className="flex flex-col gap-3">
            {suggestedUsers.map((user) => (
              <div key={user.id} className="flex items-center gap-3">
                <UserAvatar src={user.avatar} name={user.name} isOnline={user.isOnline} size="sm" />
                <div className="flex-1 overflow-hidden">
                  <Link href={`/profile/${user.id}`} className="text-sm font-medium text-foreground hover:underline truncate block">
                    {user.name}
                  </Link>
                  <div className="flex items-center gap-1">
                    <UniversityBadge shortName={user.university.shortName} className="text-[10px] px-1.5" />
                    <span className="text-[10px] text-muted-foreground truncate">{user.course}</span>
                  </div>
                </div>
                <Button variant="outline" size="sm" className="h-7 text-xs">
                  Follow
                </Button>
              </div>
            ))}
          </div>
          <Link href="/search" className="mt-3 block text-xs font-medium text-primary hover:underline">
            See all suggestions
          </Link>
        </div>

        {/* Footer links */}
        <div className="px-1">
          <p className="text-[10px] text-muted-foreground leading-relaxed">
            About &middot; Help &middot; Privacy &middot; Terms &middot; Careers
          </p>
          <p className="mt-1 text-[10px] text-muted-foreground">Uni-Verse &copy; 2026</p>
        </div>
      </div>
    </aside>
  )
}
