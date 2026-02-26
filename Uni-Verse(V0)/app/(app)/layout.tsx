"use client"

import { useState } from "react"
import { SidebarNav } from "@/components/universe/sidebar-nav"
import { BottomNav } from "@/components/universe/bottom-nav"
import { TopBar } from "@/components/universe/top-bar"
import { CreatePostDialog } from "@/components/universe/feed/create-post"

export default function AppLayout({ children }: { children: React.ReactNode }) {
  const [createOpen, setCreateOpen] = useState(false)

  return (
    <div className="flex min-h-screen bg-background">
      <SidebarNav />
      <div className="flex flex-1 flex-col">
        <TopBar />
        <main className="flex-1 pb-20 lg:pb-0">
          {children}
        </main>
      </div>
      <BottomNav onCreateClick={() => setCreateOpen(true)} />
      <CreatePostDialog open={createOpen} onOpenChange={setCreateOpen} />
    </div>
  )
}
