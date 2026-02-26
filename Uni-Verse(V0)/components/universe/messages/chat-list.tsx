"use client"

import Link from "next/link"
import { conversations } from "@/lib/mock-data"
import { currentUser } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { cn } from "@/lib/utils"

export function ChatList() {
  return (
    <div className="flex flex-col">
      {conversations.map((conv) => {
        const otherUser = conv.participants.find((p) => p.id !== currentUser.id) || conv.participants[0]
        const displayName = conv.isGroup ? conv.groupName : otherUser.name
        const avatar = conv.isGroup ? (conv.participants[1]?.avatar || otherUser.avatar) : otherUser.avatar
        const isSentByMe = conv.lastMessage.senderId === currentUser.id

        return (
          <Link
            key={conv.id}
            href={`/messages/${conv.id}`}
            className={cn(
              "flex items-center gap-3 px-4 py-3 transition-colors hover:bg-secondary",
              conv.unreadCount > 0 && "bg-primary/5"
            )}
          >
            <div className="relative">
              <UserAvatar
                src={avatar}
                name={displayName || "Group"}
                isOnline={!conv.isGroup ? otherUser.isOnline : undefined}
                size="lg"
              />
              {conv.isGroup && (
                <span className="absolute -bottom-0.5 -right-0.5 flex h-5 w-5 items-center justify-center rounded-full bg-accent text-[9px] font-bold text-accent-foreground border-2 border-card">
                  {conv.participants.length}
                </span>
              )}
            </div>
            <div className="flex-1 overflow-hidden">
              <div className="flex items-center justify-between">
                <p className={cn("text-sm truncate", conv.unreadCount > 0 ? "font-bold text-foreground" : "font-medium text-foreground")}>
                  {displayName}
                </p>
                <span className={cn("text-[10px] shrink-0", conv.unreadCount > 0 ? "text-primary font-semibold" : "text-muted-foreground")}>
                  {conv.lastMessage.createdAt}
                </span>
              </div>
              <div className="flex items-center justify-between">
                <p className={cn("text-xs truncate", conv.unreadCount > 0 ? "text-foreground font-medium" : "text-muted-foreground")}>
                  {isSentByMe && <span className="text-muted-foreground">You: </span>}
                  {conv.lastMessage.content}
                </p>
                {conv.unreadCount > 0 && (
                  <span className="ml-2 flex h-5 min-w-5 shrink-0 items-center justify-center rounded-full bg-primary px-1.5 text-[10px] font-bold text-primary-foreground">
                    {conv.unreadCount}
                  </span>
                )}
              </div>
            </div>
          </Link>
        )
      })}
    </div>
  )
}
