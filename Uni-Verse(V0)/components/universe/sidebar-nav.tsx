"use client"

import Link from "next/link"
import { usePathname } from "next/navigation"
import { cn } from "@/lib/utils"
import { useAuth } from "@/lib/auth-context"
import { UserAvatar } from "./shared/user-avatar"
import {
  Home,
  Search,
  MessageCircle,
  Users,
  Video,
  Bell,
  User,
  Settings,
  GraduationCap,
  LogOut,
} from "lucide-react"

const navItems = [
  { href: "/feed", label: "Feed", icon: Home },
  { href: "/search", label: "Search", icon: Search },
  { href: "/messages", label: "Messages", icon: MessageCircle },
  { href: "/groups", label: "Groups", icon: Users },
  { href: "/video", label: "Video Calls", icon: Video },
  { href: "/notifications", label: "Notifications", icon: Bell },
  { href: "/profile", label: "Profile", icon: User },
]

export function SidebarNav() {
  const pathname = usePathname()
  const { user, logout } = useAuth()

  return (
    <aside className="hidden lg:flex lg:w-[260px] lg:flex-col lg:border-r lg:border-border lg:bg-card">
      <div className="flex h-full flex-col">
        {/* Logo */}
        <div className="flex items-center gap-2.5 border-b border-border px-5 py-4">
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary">
            <GraduationCap className="h-5 w-5 text-primary-foreground" />
          </div>
          <span className="text-xl font-bold text-foreground">Uni-Verse</span>
        </div>

        {/* Navigation */}
        <nav className="flex-1 px-3 py-4">
          <ul className="flex flex-col gap-1" role="list">
            {navItems.map((item) => {
              const isActive = pathname === item.href || pathname.startsWith(item.href + "/")
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    className={cn(
                      "flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors",
                      isActive
                        ? "bg-primary/10 text-primary"
                        : "text-muted-foreground hover:bg-secondary hover:text-foreground"
                    )}
                  >
                    <item.icon className="h-5 w-5" />
                    {item.label}
                    {item.label === "Messages" && (
                      <span className="ml-auto flex h-5 min-w-5 items-center justify-center rounded-full bg-primary px-1.5 text-[10px] font-bold text-primary-foreground">
                        3
                      </span>
                    )}
                    {item.label === "Notifications" && (
                      <span className="ml-auto flex h-5 min-w-5 items-center justify-center rounded-full bg-destructive px-1.5 text-[10px] font-bold text-primary-foreground">
                        5
                      </span>
                    )}
                  </Link>
                </li>
              )
            })}
          </ul>
        </nav>

        {/* User section */}
        {user && (
          <div className="border-t border-border p-3">
            <Link
              href="/settings"
              className={cn(
                "mb-1 flex items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium transition-colors",
                pathname === "/settings"
                  ? "bg-primary/10 text-primary"
                  : "text-muted-foreground hover:bg-secondary hover:text-foreground"
              )}
            >
              <Settings className="h-5 w-5" />
              Settings
            </Link>
            <div className="flex items-center gap-3 rounded-lg px-3 py-2">
              <UserAvatar src={user.avatar} name={user.name} isOnline size="sm" />
              <div className="flex-1 overflow-hidden">
                <p className="truncate text-sm font-medium text-foreground">{user.name}</p>
                <p className="truncate text-xs text-muted-foreground">@{user.username}</p>
              </div>
              <button
                onClick={logout}
                className="rounded-md p-1.5 text-muted-foreground hover:bg-secondary hover:text-foreground transition-colors"
                aria-label="Log out"
              >
                <LogOut className="h-4 w-4" />
              </button>
            </div>
          </div>
        )}
      </div>
    </aside>
  )
}
