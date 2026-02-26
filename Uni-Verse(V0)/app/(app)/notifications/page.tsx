"use client"

import { useState } from "react"
import { notifications as allNotifications } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { Button } from "@/components/ui/button"
import { Heart, MessageCircle, UserPlus, Users, AtSign, Bell, Check, CheckCheck } from "lucide-react"
import { cn } from "@/lib/utils"
import Link from "next/link"
import type { Notification } from "@/lib/types"

const notifIcon: Record<Notification["type"], typeof Heart> = {
  like: Heart,
  comment: MessageCircle,
  follow: UserPlus,
  "group-invite": Users,
  mention: AtSign,
  message: MessageCircle,
}

const notifColor: Record<Notification["type"], string> = {
  like: "text-red-500 bg-red-500/10",
  comment: "text-universe-blue bg-universe-blue/10",
  follow: "text-primary bg-primary/10",
  "group-invite": "text-universe-teal bg-universe-teal/10",
  mention: "text-orange-500 bg-orange-500/10",
  message: "text-primary bg-primary/10",
}

const tabs = [
  { id: "all", label: "All" },
  { id: "unread", label: "Unread" },
  { id: "mentions", label: "Mentions" },
]

export default function NotificationsPage() {
  const [notifications, setNotifications] = useState(allNotifications)
  const [activeTab, setActiveTab] = useState("all")

  const unreadCount = notifications.filter((n) => !n.read).length

  const filtered = notifications.filter((n) => {
    if (activeTab === "unread") return !n.read
    if (activeTab === "mentions") return n.type === "mention"
    return true
  })

  const markAllRead = () => {
    setNotifications((prev) => prev.map((n) => ({ ...n, read: true })))
  }

  const markAsRead = (id: string) => {
    setNotifications((prev) =>
      prev.map((n) => (n.id === id ? { ...n, read: true } : n))
    )
  }

  return (
    <div className="mx-auto max-w-3xl">
      {/* Header */}
      <div className="sticky top-0 z-10 border-b border-border bg-card/95 backdrop-blur-md">
        <div className="flex items-center justify-between px-4 py-3">
          <div className="flex items-center gap-2">
            <h1 className="text-lg font-bold text-foreground">Notifications</h1>
            {unreadCount > 0 && (
              <span className="flex h-5 min-w-5 items-center justify-center rounded-full bg-primary px-1.5 text-[10px] font-bold text-primary-foreground">
                {unreadCount}
              </span>
            )}
          </div>
          {unreadCount > 0 && (
            <Button variant="ghost" size="sm" className="gap-1.5 text-xs text-muted-foreground" onClick={markAllRead}>
              <CheckCheck className="h-3.5 w-3.5" />
              Mark all read
            </Button>
          )}
        </div>

        {/* Tabs */}
        <div className="flex gap-1 px-4 pb-3">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={cn(
                "rounded-full px-3 py-1.5 text-xs font-medium transition-colors",
                activeTab === tab.id
                  ? "bg-primary text-primary-foreground"
                  : "bg-secondary text-muted-foreground hover:text-foreground"
              )}
            >
              {tab.label}
              {tab.id === "unread" && unreadCount > 0 && (
                <span className="ml-1.5">{unreadCount}</span>
              )}
            </button>
          ))}
        </div>
      </div>

      {/* Notification list */}
      <div className="flex flex-col">
        {filtered.length === 0 && (
          <div className="py-20 text-center">
            <Bell className="mx-auto h-12 w-12 text-muted-foreground/40" />
            <p className="mt-3 text-sm font-medium text-foreground">
              {activeTab === "unread" ? "All caught up!" : "No notifications yet"}
            </p>
            <p className="mt-1 text-xs text-muted-foreground">
              {activeTab === "unread" ? "You have no unread notifications" : "Notifications will appear here"}
            </p>
          </div>
        )}

        {filtered.map((n) => {
          const Icon = notifIcon[n.type]
          const colorClass = notifColor[n.type]

          return (
            <div
              key={n.id}
              onClick={() => markAsRead(n.id)}
              className={cn(
                "flex items-start gap-3 border-b border-border px-4 py-3.5 transition-colors cursor-pointer",
                !n.read ? "bg-primary/5" : "hover:bg-secondary/50"
              )}
              role="button"
              tabIndex={0}
              onKeyDown={(e) => { if (e.key === "Enter") markAsRead(n.id) }}
            >
              {/* Avatar */}
              <div className="relative shrink-0">
                <Link href={`/profile/${n.actor.id}`}>
                  <UserAvatar src={n.actor.avatar} name={n.actor.name} size="md" showStatus={false} />
                </Link>
                <span className={cn("absolute -bottom-1 -right-1 flex h-5 w-5 items-center justify-center rounded-full", colorClass)}>
                  <Icon className="h-3 w-3" />
                </span>
              </div>

              {/* Content */}
              <div className="flex-1 min-w-0">
                <p className="text-sm leading-relaxed text-foreground">
                  <Link href={`/profile/${n.actor.id}`} className="font-semibold hover:underline">
                    {n.actor.name}
                  </Link>{" "}
                  <span className="text-muted-foreground">{n.content}</span>
                </p>
                <p className="mt-0.5 text-xs text-muted-foreground">{n.createdAt}</p>

                {/* Action buttons for specific types */}
                {n.type === "follow" && !n.read && (
                  <Button size="sm" className="mt-2 h-7 text-xs px-3">Follow Back</Button>
                )}
                {n.type === "group-invite" && !n.read && (
                  <div className="mt-2 flex gap-2">
                    <Button size="sm" className="h-7 text-xs px-3">Join Group</Button>
                    <Button size="sm" variant="outline" className="h-7 text-xs px-3">Decline</Button>
                  </div>
                )}
              </div>

              {/* Unread indicator */}
              {!n.read && (
                <div className="mt-2 shrink-0">
                  <span className="flex h-2.5 w-2.5 rounded-full bg-primary" />
                </div>
              )}
              {n.read && (
                <div className="mt-2 shrink-0">
                  <Check className="h-3.5 w-3.5 text-muted-foreground/40" />
                </div>
              )}
            </div>
          )
        })}
      </div>
    </div>
  )
}
