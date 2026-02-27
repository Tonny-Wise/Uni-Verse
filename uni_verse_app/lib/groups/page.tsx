"use client"

import { useState } from "react"
import Link from "next/link"
import { groups } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { UniversityBadge } from "@/components/universe/shared/university-badge"
import { Button } from "@/components/ui/button"
import { Search, Users, Plus } from "lucide-react"
import { cn } from "@/lib/utils"
import { toast } from "sonner"

const tabs = ["My Groups", "Discover"]
const categories = ["All", "course", "club", "study-group", "general"]
const categoryLabels: Record<string, string> = {
  All: "All",
  course: "Courses",
  club: "Clubs",
  "study-group": "Study Groups",
  general: "General",
}

export default function GroupsPage() {
  const [activeTab, setActiveTab] = useState("Discover")
  const [selectedCategory, setSelectedCategory] = useState("All")
  const [search, setSearch] = useState("")
  const [joinedGroups, setJoinedGroups] = useState<Set<string>>(
    new Set(groups.filter((g) => g.isJoined).map((g) => g.id))
  )

  const filteredGroups = groups.filter((g) => {
    if (activeTab === "My Groups" && !joinedGroups.has(g.id)) return false
    if (selectedCategory !== "All" && g.category !== selectedCategory) return false
    if (search && !g.name.toLowerCase().includes(search.toLowerCase())) return false
    return true
  })

  const handleJoin = (groupId: string) => {
    setJoinedGroups((prev) => {
      const next = new Set(prev)
      if (next.has(groupId)) {
        next.delete(groupId)
        toast.success("Left group")
      } else {
        next.add(groupId)
        toast.success("Joined group!")
      }
      return next
    })
  }

  return (
    <div className="mx-auto max-w-3xl">
      {/* Header */}
      <div className="sticky top-0 z-30 border-b border-border bg-card lg:top-0">
        <div className="flex items-center justify-between px-4 py-3">
          <h1 className="text-xl font-bold text-foreground">Groups</h1>
          <Button size="sm" className="gap-1.5">
            <Plus className="h-4 w-4" />
            Create
          </Button>
        </div>

        {/* Search */}
        <div className="px-4 pb-3">
          <div className="flex items-center gap-2 rounded-full border border-border bg-secondary px-3 py-2">
            <Search className="h-4 w-4 text-muted-foreground" />
            <input
              type="text"
              placeholder="Search groups..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 bg-transparent text-sm text-foreground placeholder:text-muted-foreground outline-none"
            />
          </div>
        </div>

        {/* Tabs */}
        <div className="flex border-b border-border">
          {tabs.map((tab) => (
            <button
              key={tab}
              onClick={() => setActiveTab(tab)}
              className={cn(
                "flex-1 py-2.5 text-sm font-medium transition-colors relative",
                activeTab === tab ? "text-primary" : "text-muted-foreground hover:text-foreground"
              )}
            >
              {tab}
              {activeTab === tab && (
                <span className="absolute bottom-0 left-1/4 right-1/4 h-0.5 rounded-full bg-primary" />
              )}
            </button>
          ))}
        </div>
      </div>

      {/* Category filter */}
      <div className="flex gap-2 overflow-x-auto px-4 py-3 scrollbar-hide">
        {categories.map((cat) => (
          <button
            key={cat}
            onClick={() => setSelectedCategory(cat)}
            className={cn(
              "shrink-0 rounded-full border px-3 py-1.5 text-xs font-medium transition-colors",
              selectedCategory === cat
                ? "border-primary bg-primary/10 text-primary"
                : "border-border text-muted-foreground hover:bg-secondary"
            )}
          >
            {categoryLabels[cat]}
          </button>
        ))}
      </div>

      {/* Group cards */}
      <div className="flex flex-col gap-3 px-4 pb-4">
        {filteredGroups.map((group) => {
          const isJoined = joinedGroups.has(group.id)
          return (
            <div key={group.id} className="overflow-hidden rounded-xl border border-border bg-card">
              {/* Cover */}
              <div className="relative h-28 bg-muted">
                <img
                  src={group.coverImage}
                  alt={group.name}
                  className="h-full w-full object-cover"
                  crossOrigin="anonymous"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-foreground/40 to-transparent" />
                <span className="absolute left-3 top-3 rounded-full bg-card/90 px-2 py-0.5 text-[10px] font-medium text-foreground backdrop-blur-sm">
                  {categoryLabels[group.category]}
                </span>
              </div>

              {/* Info */}
              <div className="p-4">
                <div className="flex items-start justify-between gap-3">
                  <div className="flex-1">
                    <Link href={`/groups/${group.id}`} className="text-sm font-bold text-foreground hover:underline">
                      {group.name}
                    </Link>
                    <div className="mt-1 flex items-center gap-2">
                      <UniversityBadge shortName={group.university.shortName} />
                      <span className="flex items-center gap-1 text-xs text-muted-foreground">
                        <Users className="h-3 w-3" />
                        {group.memberCount.toLocaleString()} members
                      </span>
                    </div>
                  </div>
                  <Button
                    variant={isJoined ? "outline" : "default"}
                    size="sm"
                    className="shrink-0"
                    onClick={() => handleJoin(group.id)}
                  >
                    {isJoined ? "Joined" : "Join"}
                  </Button>
                </div>
                <p className="mt-2 text-xs text-muted-foreground leading-relaxed line-clamp-2">{group.description}</p>

                {/* Member avatars */}
                <div className="mt-3 flex items-center">
                  <div className="flex -space-x-2">
                    {group.members.slice(0, 3).map((member) => (
                      <UserAvatar
                        key={member.id}
                        src={member.avatar}
                        name={member.name}
                        size="sm"
                        showStatus={false}
                        className="border-2 border-card"
                      />
                    ))}
                  </div>
                  {group.memberCount > 3 && (
                    <span className="ml-2 text-xs text-muted-foreground">
                      +{(group.memberCount - 3).toLocaleString()} more
                    </span>
                  )}
                </div>
              </div>
            </div>
          )
        })}

        {filteredGroups.length === 0 && (
          <div className="py-16 text-center">
            <Users className="mx-auto h-12 w-12 text-muted-foreground/40" />
            <p className="mt-3 text-sm text-muted-foreground">No groups found</p>
          </div>
        )}
      </div>
    </div>
  )
}
