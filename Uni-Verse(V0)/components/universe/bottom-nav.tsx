"use client"

import Link from "next/link"
import { usePathname } from "next/navigation"
import { cn } from "@/lib/utils"
import { Home, Search, PlusSquare, MessageCircle, User } from "lucide-react"

const navItems = [
  { href: "/feed", label: "Home", icon: Home },
  { href: "/search", label: "Search", icon: Search },
  { href: "/create", label: "Create", icon: PlusSquare },
  { href: "/messages", label: "Chat", icon: MessageCircle, badge: 3 },
  { href: "/profile", label: "Profile", icon: User },
]

export function BottomNav({ onCreateClick }: { onCreateClick?: () => void }) {
  const pathname = usePathname()

  return (
    <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-border bg-card/95 backdrop-blur-md lg:hidden" role="navigation" aria-label="Mobile navigation">
      <div className="flex items-center justify-around px-2 py-2">
        {navItems.map((item) => {
          const isActive = item.href === "/create" ? false : (pathname === item.href || pathname.startsWith(item.href + "/"))
          const isCreate = item.href === "/create"

          if (isCreate) {
            return (
              <button
                key={item.href}
                onClick={onCreateClick}
                className="relative flex flex-col items-center gap-0.5 px-3 py-1"
                aria-label="Create post"
              >
                <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary">
                  <item.icon className="h-5 w-5 text-primary-foreground" />
                </div>
              </button>
            )
          }

          return (
            <Link
              key={item.href}
              href={item.href}
              className={cn(
                "relative flex flex-col items-center gap-0.5 px-3 py-1 transition-colors",
                isActive ? "text-primary" : "text-muted-foreground"
              )}
            >
              <div className="relative">
                <item.icon className="h-6 w-6" />
                {item.badge && (
                  <span className="absolute -right-2 -top-1 flex h-4 min-w-4 items-center justify-center rounded-full bg-primary px-1 text-[9px] font-bold text-primary-foreground">
                    {item.badge}
                  </span>
                )}
              </div>
              <span className="text-[10px] font-medium">{item.label}</span>
            </Link>
          )
        })}
      </div>
      {/* Safe area spacing for iOS */}
      <div className="h-[env(safe-area-inset-bottom)]" />
    </nav>
  )
}
