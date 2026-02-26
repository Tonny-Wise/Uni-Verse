"use client"

import { useState } from "react"
import { posts } from "@/lib/mock-data"
import { StoriesBar } from "@/components/universe/feed/stories-bar"
import { PostCard } from "@/components/universe/feed/post-card"
import { CreatePostInline, CreatePostDialog } from "@/components/universe/feed/create-post"
import { RightSidebar } from "@/components/universe/feed/right-sidebar"
import { cn } from "@/lib/utils"

const filterTabs = ["For You", "Following", "My University", "Study Tips"]

export default function FeedPage() {
  const [activeTab, setActiveTab] = useState("For You")
  const [createOpen, setCreateOpen] = useState(false)

  const filteredPosts =
    activeTab === "Study Tips"
      ? posts.filter((p) => p.type === "study-tip")
      : posts

  return (
    <div className="flex">
      <div className="flex-1">
        {/* Stories */}
        <div className="border-b border-border bg-card">
          <StoriesBar />
        </div>

        {/* Filter tabs */}
        <div className="flex border-b border-border bg-card">
          {filterTabs.map((tab) => (
            <button
              key={tab}
              onClick={() => setActiveTab(tab)}
              className={cn(
                "flex-1 py-3 text-sm font-medium transition-colors relative",
                activeTab === tab
                  ? "text-primary"
                  : "text-muted-foreground hover:text-foreground"
              )}
            >
              {tab}
              {activeTab === tab && (
                <span className="absolute bottom-0 left-1/4 right-1/4 h-0.5 rounded-full bg-primary" />
              )}
            </button>
          ))}
        </div>

        {/* Create post */}
        <CreatePostInline onOpen={() => setCreateOpen(true)} />

        {/* Posts */}
        <div className="flex flex-col">
          {filteredPosts.map((post) => (
            <PostCard key={post.id} post={post} />
          ))}
        </div>

        <CreatePostDialog open={createOpen} onOpenChange={setCreateOpen} />
      </div>

      {/* Right sidebar (desktop only) */}
      <RightSidebar />
    </div>
  )
}
