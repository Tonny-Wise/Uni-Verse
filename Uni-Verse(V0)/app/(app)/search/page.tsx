"use client"

import { useState, useMemo } from "react"
import { users, groups, posts, universities, trendingTopics } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { UniversityBadge } from "@/components/universe/shared/university-badge"
import { PostCard } from "@/components/universe/feed/post-card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Search, Users, FileText, GraduationCap, TrendingUp, X } from "lucide-react"
import { cn } from "@/lib/utils"
import Link from "next/link"

const tabs = [
  { id: "all", label: "All" },
  { id: "people", label: "People", icon: Users },
  { id: "posts", label: "Posts", icon: FileText },
  { id: "groups", label: "Groups", icon: Users },
  { id: "universities", label: "Universities", icon: GraduationCap },
]

export default function SearchPage() {
  const [query, setQuery] = useState("")
  const [activeTab, setActiveTab] = useState("all")

  const filteredUsers = useMemo(
    () =>
      users.filter(
        (u) =>
          u.name.toLowerCase().includes(query.toLowerCase()) ||
          u.username.toLowerCase().includes(query.toLowerCase()) ||
          u.university.name.toLowerCase().includes(query.toLowerCase()) ||
          u.course.toLowerCase().includes(query.toLowerCase())
      ),
    [query]
  )

  const filteredPosts = useMemo(
    () => posts.filter((p) => p.content.toLowerCase().includes(query.toLowerCase())),
    [query]
  )

  const filteredGroups = useMemo(
    () =>
      groups.filter(
        (g) =>
          g.name.toLowerCase().includes(query.toLowerCase()) ||
          g.description.toLowerCase().includes(query.toLowerCase())
      ),
    [query]
  )

  const filteredUnis = useMemo(
    () =>
      universities.filter(
        (u) =>
          u.name.toLowerCase().includes(query.toLowerCase()) ||
          u.shortName.toLowerCase().includes(query.toLowerCase()) ||
          u.location.toLowerCase().includes(query.toLowerCase())
      ),
    [query]
  )

  const hasQuery = query.trim().length > 0

  return (
    <div className="mx-auto max-w-3xl">
      {/* Search header */}
      <div className="sticky top-0 z-10 border-b border-border bg-card/95 backdrop-blur-md px-4 py-3">
        <div className="relative">
          <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            placeholder="Search students, posts, groups, universities..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className="pl-10 pr-10 bg-secondary border-none"
          />
          {hasQuery && (
            <button
              onClick={() => setQuery("")}
              className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
              aria-label="Clear search"
            >
              <X className="h-4 w-4" />
            </button>
          )}
        </div>

        {/* Tabs */}
        <div className="mt-3 flex gap-1 overflow-x-auto scrollbar-hide">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={cn(
                "flex items-center gap-1.5 whitespace-nowrap rounded-full px-3 py-1.5 text-xs font-medium transition-colors",
                activeTab === tab.id
                  ? "bg-primary text-primary-foreground"
                  : "bg-secondary text-muted-foreground hover:text-foreground"
              )}
            >
              {tab.icon && <tab.icon className="h-3 w-3" />}
              {tab.label}
            </button>
          ))}
        </div>
      </div>

      {/* Empty state: trending topics */}
      {!hasQuery && (
        <div className="px-4 py-6">
          <div className="flex items-center gap-2 mb-4">
            <TrendingUp className="h-5 w-5 text-primary" />
            <h2 className="text-base font-semibold text-foreground">Trending on Uni-Verse</h2>
          </div>
          <div className="flex flex-col gap-3">
            {trendingTopics.map((topic, idx) => (
              <button
                key={topic.tag}
                onClick={() => setQuery(topic.tag.replace("#", ""))}
                className="flex items-center justify-between rounded-lg px-3 py-3 hover:bg-secondary transition-colors text-left"
              >
                <div className="flex items-center gap-3">
                  <span className="flex h-7 w-7 items-center justify-center rounded-full bg-primary/10 text-xs font-bold text-primary">
                    {idx + 1}
                  </span>
                  <div>
                    <p className="text-sm font-semibold text-foreground">{topic.tag}</p>
                    <p className="text-xs text-muted-foreground">{topic.posts.toLocaleString()} posts</p>
                  </div>
                </div>
              </button>
            ))}
          </div>

          {/* Suggested people */}
          <div className="mt-8">
            <h2 className="mb-4 text-base font-semibold text-foreground">Suggested for you</h2>
            <div className="flex flex-col gap-2">
              {users.slice(0, 5).map((u) => (
                <Link
                  key={u.id}
                  href={`/profile/${u.id}`}
                  className="flex items-center gap-3 rounded-lg px-3 py-2.5 hover:bg-secondary transition-colors"
                >
                  <UserAvatar src={u.avatar} name={u.name} isOnline={u.isOnline} size="md" />
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-1.5">
                      <p className="text-sm font-medium text-foreground truncate">{u.name}</p>
                      {u.isVerified && (
                        <span className="flex h-4 w-4 items-center justify-center rounded-full bg-primary" aria-label="Verified">
                          <svg className="h-2.5 w-2.5 text-primary-foreground" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><path d="M20 6 9 17l-5-5"/></svg>
                        </span>
                      )}
                    </div>
                    <p className="text-xs text-muted-foreground truncate">
                      {u.course} &middot; {u.university.shortName}
                    </p>
                  </div>
                  <Button variant="outline" size="sm" className="shrink-0 text-xs">Follow</Button>
                </Link>
              ))}
            </div>
          </div>
        </div>
      )}

      {/* Search results */}
      {hasQuery && (
        <div className="py-2">
          {/* People */}
          {(activeTab === "all" || activeTab === "people") && filteredUsers.length > 0 && (
            <section className="px-4 py-3">
              {activeTab === "all" && <h3 className="mb-3 text-sm font-semibold text-muted-foreground uppercase tracking-wide">People</h3>}
              <div className="flex flex-col gap-1">
                {(activeTab === "all" ? filteredUsers.slice(0, 3) : filteredUsers).map((u) => (
                  <Link
                    key={u.id}
                    href={`/profile/${u.id}`}
                    className="flex items-center gap-3 rounded-lg px-3 py-2.5 hover:bg-secondary transition-colors"
                  >
                    <UserAvatar src={u.avatar} name={u.name} isOnline={u.isOnline} size="md" />
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-1.5">
                        <p className="text-sm font-medium text-foreground truncate">{u.name}</p>
                        {u.isVerified && (
                          <span className="flex h-4 w-4 items-center justify-center rounded-full bg-primary" aria-label="Verified">
                            <svg className="h-2.5 w-2.5 text-primary-foreground" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><path d="M20 6 9 17l-5-5"/></svg>
                          </span>
                        )}
                      </div>
                      <p className="text-xs text-muted-foreground truncate">
                        @{u.username} &middot; {u.course} &middot; {u.university.shortName}
                      </p>
                    </div>
                    <div className="text-right shrink-0">
                      <p className="text-xs text-muted-foreground">{u.followers.toLocaleString()} followers</p>
                    </div>
                  </Link>
                ))}
              </div>
              {activeTab === "all" && filteredUsers.length > 3 && (
                <button onClick={() => setActiveTab("people")} className="mt-2 text-xs font-medium text-primary hover:underline px-3">
                  See all {filteredUsers.length} people
                </button>
              )}
            </section>
          )}

          {/* Groups */}
          {(activeTab === "all" || activeTab === "groups") && filteredGroups.length > 0 && (
            <section className="px-4 py-3">
              {activeTab === "all" && <h3 className="mb-3 text-sm font-semibold text-muted-foreground uppercase tracking-wide">Groups</h3>}
              <div className="flex flex-col gap-2">
                {(activeTab === "all" ? filteredGroups.slice(0, 3) : filteredGroups).map((g) => (
                  <Link
                    key={g.id}
                    href={`/groups/${g.id}`}
                    className="flex items-center gap-3 rounded-lg px-3 py-2.5 hover:bg-secondary transition-colors"
                  >
                    <div className="h-10 w-10 shrink-0 rounded-lg bg-cover bg-center" style={{ backgroundImage: `url(${g.coverImage})` }} />
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-foreground truncate">{g.name}</p>
                      <p className="text-xs text-muted-foreground truncate">
                        {g.memberCount.toLocaleString()} members &middot; {g.university.shortName}
                      </p>
                    </div>
                    <Badge variant={g.isJoined ? "secondary" : "outline"} className="shrink-0 text-xs">
                      {g.isJoined ? "Joined" : "Join"}
                    </Badge>
                  </Link>
                ))}
              </div>
            </section>
          )}

          {/* Universities */}
          {(activeTab === "all" || activeTab === "universities") && filteredUnis.length > 0 && (
            <section className="px-4 py-3">
              {activeTab === "all" && <h3 className="mb-3 text-sm font-semibold text-muted-foreground uppercase tracking-wide">Universities</h3>}
              <div className="flex flex-col gap-2">
                {filteredUnis.map((u) => (
                  <div
                    key={u.id}
                    className="flex items-center gap-3 rounded-lg px-3 py-2.5 hover:bg-secondary transition-colors"
                  >
                    <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10">
                      <GraduationCap className="h-5 w-5 text-primary" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-foreground truncate">{u.name}</p>
                      <p className="text-xs text-muted-foreground">{u.location}</p>
                    </div>
                    <UniversityBadge shortName={u.shortName} />
                  </div>
                ))}
              </div>
            </section>
          )}

          {/* Posts */}
          {(activeTab === "all" || activeTab === "posts") && filteredPosts.length > 0 && (
            <section>
              {activeTab === "all" && <h3 className="mb-1 px-4 py-3 text-sm font-semibold text-muted-foreground uppercase tracking-wide">Posts</h3>}
              {(activeTab === "all" ? filteredPosts.slice(0, 2) : filteredPosts).map((p) => (
                <PostCard key={p.id} post={p} />
              ))}
            </section>
          )}

          {/* No results */}
          {filteredUsers.length === 0 && filteredPosts.length === 0 && filteredGroups.length === 0 && filteredUnis.length === 0 && (
            <div className="py-20 text-center">
              <Search className="mx-auto h-12 w-12 text-muted-foreground/40" />
              <p className="mt-3 text-sm font-medium text-foreground">No results found</p>
              <p className="mt-1 text-xs text-muted-foreground">
                {"Try searching for different keywords"}
              </p>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
