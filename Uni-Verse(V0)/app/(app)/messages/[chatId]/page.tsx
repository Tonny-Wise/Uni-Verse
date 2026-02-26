"use client"

import { useState, useRef, useEffect, use } from "react"
import Link from "next/link"
import { conversations, chatMessages, currentUser } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { ChatBubble } from "@/components/universe/messages/chat-bubble"
import { Button } from "@/components/ui/button"
import { ArrowLeft, Phone, Video, MoreVertical, Send, Paperclip, Smile, Mic } from "lucide-react"
import type { Message } from "@/lib/types"

export default function ChatPage({ params }: { params: Promise<{ chatId: string }> }) {
  const { chatId } = use(params)
  const conv = conversations.find((c) => c.id === chatId)
  const initialMessages = chatMessages[chatId] || []
  const [messages, setMessages] = useState<Message[]>(initialMessages)
  const [input, setInput] = useState("")
  const scrollRef = useRef<HTMLDivElement>(null)

  const otherUser = conv?.participants.find((p) => p.id !== currentUser.id) || conv?.participants[0]
  const displayName = conv?.isGroup ? conv.groupName : otherUser?.name

  useEffect(() => {
    scrollRef.current?.scrollTo(0, scrollRef.current.scrollHeight)
  }, [messages])

  const handleSend = (e: React.FormEvent) => {
    e.preventDefault()
    if (!input.trim()) return
    const newMsg: Message = {
      id: `new-${Date.now()}`,
      senderId: currentUser.id,
      content: input.trim(),
      createdAt: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
      type: "text",
      read: false,
    }
    setMessages([...messages, newMsg])
    setInput("")
  }

  if (!conv || !otherUser) {
    return (
      <div className="flex h-[80vh] items-center justify-center">
        <p className="text-muted-foreground">Conversation not found</p>
      </div>
    )
  }

  return (
    <div className="flex h-[calc(100vh-64px)] flex-col lg:h-screen">
      {/* Chat header */}
      <div className="flex items-center gap-3 border-b border-border bg-card px-3 py-2.5">
        <Link href="/messages" className="rounded-full p-1.5 text-muted-foreground hover:bg-secondary lg:hidden" aria-label="Back">
          <ArrowLeft className="h-5 w-5" />
        </Link>
        <UserAvatar
          src={otherUser.avatar}
          name={displayName || "Chat"}
          isOnline={!conv.isGroup ? otherUser.isOnline : undefined}
          size="md"
        />
        <div className="flex-1">
          <p className="text-sm font-semibold text-foreground">{displayName}</p>
          <p className="text-xs text-muted-foreground">
            {conv.isGroup
              ? `${conv.participants.length} members`
              : otherUser.isOnline
              ? "Online"
              : "Last seen recently"}
          </p>
        </div>
        <div className="flex items-center gap-1">
          <Button variant="ghost" size="icon" className="h-9 w-9 text-muted-foreground" aria-label="Voice call">
            <Phone className="h-5 w-5" />
          </Button>
          <Link href="/video/new">
            <Button variant="ghost" size="icon" className="h-9 w-9 text-muted-foreground" aria-label="Video call">
              <Video className="h-5 w-5" />
            </Button>
          </Link>
          <Button variant="ghost" size="icon" className="h-9 w-9 text-muted-foreground" aria-label="More options">
            <MoreVertical className="h-5 w-5" />
          </Button>
        </div>
      </div>

      {/* Messages */}
      <div ref={scrollRef} className="flex-1 overflow-y-auto py-4">
        <div className="flex flex-col gap-0.5">
          {messages.map((msg) => (
            <ChatBubble key={msg.id} message={msg} isOwn={msg.senderId === currentUser.id} />
          ))}
        </div>
      </div>

      {/* Input */}
      <form onSubmit={handleSend} className="flex items-end gap-2 border-t border-border bg-card px-3 py-2.5">
        <button type="button" className="shrink-0 rounded-full p-2 text-muted-foreground hover:bg-secondary" aria-label="Attach file">
          <Paperclip className="h-5 w-5" />
        </button>
        <div className="flex flex-1 items-end rounded-2xl border border-border bg-secondary px-3 py-2">
          <input
            type="text"
            placeholder="Type a message..."
            value={input}
            onChange={(e) => setInput(e.target.value)}
            className="flex-1 bg-transparent text-sm text-foreground placeholder:text-muted-foreground outline-none"
          />
          <button type="button" className="ml-1 text-muted-foreground" aria-label="Emoji">
            <Smile className="h-5 w-5" />
          </button>
        </div>
        {input.trim() ? (
          <button type="submit" className="shrink-0 rounded-full bg-primary p-2.5 text-primary-foreground" aria-label="Send">
            <Send className="h-5 w-5" />
          </button>
        ) : (
          <button type="button" className="shrink-0 rounded-full bg-primary p-2.5 text-primary-foreground" aria-label="Voice message">
            <Mic className="h-5 w-5" />
          </button>
        )}
      </form>
    </div>
  )
}
