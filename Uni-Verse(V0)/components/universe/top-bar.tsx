"use client"

import Link from "next/link"
import { useAuth } from "@/lib/auth-context"
import { UserAvatar } from "./shared/user-avatar"
import { GraduationCap, Bell } from "lucide-react"

export function TopBar() {
  const { user } = useAuth()

  return (
    <header className="sticky top-0 z-40 flex items-center justify-between border-b border-border bg-card/95 px-4 py-3 backdrop-blur-md lg:hidden">
      <div className="flex items-center gap-2">
        <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary">
          <GraduationCap className="h-4 w-4 text-primary-foreground" />
        </div>
        <span className="text-lg font-bold text-foreground">Uni-Verse</span>
      </div>
      <div className="flex items-center gap-3">
        <Link
          href="/notifications"
          className="relative rounded-full p-2 text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors"
          aria-label="Notifications"
        >
          <Bell className="h-5 w-5" />
          <span className="absolute right-1 top-1 flex h-4 min-w-4 items-center justify-center rounded-full bg-destructive px-1 text-[9px] font-bold text-primary-foreground">
            5
          </span>
        </Link>
        {user && (
          <Link href="/profile">
            <UserAvatar src={user.avatar} name={user.name} isOnline size="sm" showStatus={false} />
          </Link>
        )}
      </div>
    </header>
  )
}
