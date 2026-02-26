"use client"

import type { Message } from "@/lib/types"
import { cn } from "@/lib/utils"
import { Check, CheckCheck } from "lucide-react"

interface ChatBubbleProps {
  message: Message
  isOwn: boolean
}

export function ChatBubble({ message, isOwn }: ChatBubbleProps) {
  return (
    <div className={cn("flex px-4 py-0.5", isOwn ? "justify-end" : "justify-start")}>
      <div
        className={cn(
          "max-w-[75%] rounded-2xl px-3.5 py-2 text-sm",
          isOwn
            ? "rounded-br-md bg-primary text-primary-foreground"
            : "rounded-bl-md bg-secondary text-foreground"
        )}
      >
        <p className="leading-relaxed">{message.content}</p>
        <div className={cn("mt-0.5 flex items-center justify-end gap-1", isOwn ? "text-primary-foreground/60" : "text-muted-foreground")}>
          <span className="text-[10px]">{message.createdAt}</span>
          {isOwn && (
            message.read
              ? <CheckCheck className="h-3 w-3 text-primary-foreground/80" />
              : <Check className="h-3 w-3" />
          )}
        </div>
      </div>
    </div>
  )
}
