"use client"

import { useState } from "react"
import { stories } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { cn } from "@/lib/utils"
import { Plus } from "lucide-react"
import { StoryViewer } from "./story-viewer"

export function StoriesBar() {
  const [selectedStory, setSelectedStory] = useState<number | null>(null)

  return (
    <>
      <div className="flex gap-3 overflow-x-auto px-4 py-3 scrollbar-hide">
        {/* Add story */}
        <button className="flex shrink-0 flex-col items-center gap-1" onClick={() => setSelectedStory(0)}>
          <div className="relative">
            <UserAvatar src={stories[0].author.avatar} name={stories[0].author.name} showStatus={false} size="lg" />
            <div className="absolute -bottom-0.5 -right-0.5 flex h-5 w-5 items-center justify-center rounded-full bg-primary border-2 border-card">
              <Plus className="h-3 w-3 text-primary-foreground" />
            </div>
          </div>
          <span className="max-w-14 truncate text-[10px] font-medium text-foreground">Your story</span>
        </button>

        {/* Other stories */}
        {stories.slice(1).map((story, index) => (
          <button
            key={story.id}
            className="flex shrink-0 flex-col items-center gap-1"
            onClick={() => setSelectedStory(index + 1)}
          >
            <div className={cn(
              "rounded-full p-[2px]",
              story.viewed
                ? "bg-muted"
                : "bg-gradient-to-br from-[var(--story-gradient-start)] to-[var(--story-gradient-end)]"
            )}>
              <div className="rounded-full border-2 border-card">
                <UserAvatar src={story.author.avatar} name={story.author.name} showStatus={false} size="lg" />
              </div>
            </div>
            <span className="max-w-14 truncate text-[10px] font-medium text-muted-foreground">
              {story.author.name.split(" ")[0]}
            </span>
          </button>
        ))}
      </div>

      {selectedStory !== null && (
        <StoryViewer
          stories={stories}
          initialIndex={selectedStory}
          onClose={() => setSelectedStory(null)}
        />
      )}
    </>
  )
}
