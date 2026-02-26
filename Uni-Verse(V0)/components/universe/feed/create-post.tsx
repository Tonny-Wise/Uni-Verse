"use client"

import { useState } from "react"
import { useAuth } from "@/lib/auth-context"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription } from "@/components/ui/dialog"
import { Button } from "@/components/ui/button"
import { Textarea } from "@/components/ui/textarea"
import { Image, Lightbulb, HelpCircle, Globe } from "lucide-react"
import { toast } from "sonner"
import { cn } from "@/lib/utils"

const postTypes = [
  { type: "text", icon: Globe, label: "Post" },
  { type: "study-tip", icon: Lightbulb, label: "Study Tip" },
  { type: "question", icon: HelpCircle, label: "Question" },
]

interface CreatePostDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
}

export function CreatePostDialog({ open, onOpenChange }: CreatePostDialogProps) {
  const { user } = useAuth()
  const [content, setContent] = useState("")
  const [selectedType, setSelectedType] = useState("text")

  const handlePost = () => {
    if (!content.trim()) return
    toast.success("Post shared successfully!")
    setContent("")
    setSelectedType("text")
    onOpenChange(false)
  }

  if (!user) return null

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-lg">
        <DialogHeader>
          <DialogTitle>Create Post</DialogTitle>
          <DialogDescription className="sr-only">Share a post, study tip, or question with the Uni-Verse community</DialogDescription>
        </DialogHeader>

        <div className="flex items-center gap-3 pb-2">
          <UserAvatar src={user.avatar} name={user.name} size="md" showStatus={false} />
          <div>
            <p className="text-sm font-semibold text-foreground">{user.name}</p>
            <p className="text-xs text-muted-foreground">{user.university.shortName} &middot; {user.course}</p>
          </div>
        </div>

        {/* Post type selector */}
        <div className="flex gap-2">
          {postTypes.map((pt) => (
            <button
              key={pt.type}
              onClick={() => setSelectedType(pt.type)}
              className={cn(
                "flex items-center gap-1.5 rounded-full border px-3 py-1.5 text-xs font-medium transition-colors",
                selectedType === pt.type
                  ? "border-primary bg-primary/10 text-primary"
                  : "border-border text-muted-foreground hover:bg-secondary"
              )}
            >
              <pt.icon className="h-3.5 w-3.5" />
              {pt.label}
            </button>
          ))}
        </div>

        <Textarea
          placeholder={
            selectedType === "study-tip"
              ? "Share a study tip with fellow students..."
              : selectedType === "question"
              ? "Ask a question to the community..."
              : "What's on your mind?"
          }
          value={content}
          onChange={(e) => setContent(e.target.value)}
          rows={5}
          className="resize-none border-none bg-secondary text-sm focus-visible:ring-0"
        />

        <div className="flex items-center justify-between">
          <div className="flex gap-1">
            <button className="rounded-full p-2 text-muted-foreground hover:bg-secondary hover:text-primary transition-colors" aria-label="Add image">
              <Image className="h-5 w-5" />
            </button>
          </div>
          <Button onClick={handlePost} disabled={!content.trim()} size="sm">
            Post
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  )
}

export function CreatePostInline({ onOpen }: { onOpen: () => void }) {
  const { user } = useAuth()
  if (!user) return null

  return (
    <div className="border-b border-border bg-card px-4 py-3">
      <div className="flex items-center gap-3">
        <UserAvatar src={user.avatar} name={user.name} size="md" showStatus={false} />
        <button
          onClick={onOpen}
          className="flex-1 rounded-full border border-border bg-secondary px-4 py-2.5 text-left text-sm text-muted-foreground hover:bg-muted transition-colors"
        >
          {"What's on your mind?"}
        </button>
      </div>
      <div className="mt-2 flex items-center gap-2 pl-13">
        <button onClick={onOpen} className="flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium text-muted-foreground hover:bg-secondary">
          <Image className="h-3.5 w-3.5 text-primary" /> Photo
        </button>
        <button onClick={onOpen} className="flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium text-muted-foreground hover:bg-secondary">
          <Lightbulb className="h-3.5 w-3.5 text-universe-green" /> Study Tip
        </button>
        <button onClick={onOpen} className="flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium text-muted-foreground hover:bg-secondary">
          <HelpCircle className="h-3.5 w-3.5 text-universe-blue" /> Question
        </button>
      </div>
    </div>
  )
}
