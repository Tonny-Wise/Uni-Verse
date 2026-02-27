"use client"

import { useState } from "react"
import { ChatList } from "@/components/universe/messages/chat-list"
import { Search, Edit } from "lucide-react"
import { cn } from "@/lib/utils"

const tabs = ["All", "Unread", "Groups"]

export default function MessagesPage() {
  const [activeTab, setActiveTab] = useState("All")
  const [search, setSearch] = useState("")

  return (
    <div className="mx-auto max-w-2xl">
      {/* Header */}
      <div className="sticky top-0 z-30 border-b border-border bg-card lg:top-0">
        <div className="flex items-center justify-between px-4 py-3">
          <h1 className="text-xl font-bold text-foreground">Messages</h1>
          <button className="rounded-full p-2 text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors" aria-label="New message">
            <Edit className="h-5 w-5" />
          </button>
        </div>

        {/* Search */}
        <div className="px-4 pb-3">
          <div className="flex items-center gap-2 rounded-full border border-border bg-secondary px-3 py-2">
            <Search className="h-4 w-4 text-muted-foreground" />
            <input
              type="text"
              placeholder="Search conversations..."
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

      {/* Chat list */}
      <ChatList />
    </div>
  )
}
