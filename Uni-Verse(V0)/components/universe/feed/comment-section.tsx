"use client"

import { useState } from "react"
import type { Comment } from "@/lib/types"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { useAuth } from "@/lib/auth-context"
import { Heart, Send } from "lucide-react"
import { cn } from "@/lib/utils"

interface CommentSectionProps {
  comments: Comment[]
}

export function CommentSection({ comments }: CommentSectionProps) {
  const { user } = useAuth()
  const [newComment, setNewComment] = useState("")
  const [localComments, setLocalComments] = useState(comments)

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (!newComment.trim() || !user) return
    setLocalComments([
      ...localComments,
      {
        id: `new-${Date.now()}`,
        author: user,
        content: newComment.trim(),
        createdAt: "Just now",
        likes: 0,
      },
    ])
    setNewComment("")
  }

  return (
    <div className="border-t border-border px-4 py-3">
      {/* Comment list */}
      <div className="flex flex-col gap-3">
        {localComments.map((comment) => (
          <CommentItem key={comment.id} comment={comment} />
        ))}
      </div>

      {/* Add comment */}
      <form onSubmit={handleSubmit} className="mt-3 flex items-center gap-2">
        {user && <UserAvatar src={user.avatar} name={user.name} size="sm" showStatus={false} />}
        <div className="flex flex-1 items-center rounded-full border border-border bg-secondary px-3">
          <input
            type="text"
            placeholder="Write a comment..."
            value={newComment}
            onChange={(e) => setNewComment(e.target.value)}
            className="flex-1 bg-transparent py-2 text-sm text-foreground placeholder:text-muted-foreground outline-none"
          />
          <button
            type="submit"
            disabled={!newComment.trim()}
            className="ml-1 text-primary disabled:text-muted-foreground"
            aria-label="Send comment"
          >
            <Send className="h-4 w-4" />
          </button>
        </div>
      </form>
    </div>
  )
}

function CommentItem({ comment }: { comment: Comment }) {
  const [liked, setLiked] = useState(false)

  return (
    <div className="flex gap-2">
      <UserAvatar src={comment.author.avatar} name={comment.author.name} size="sm" showStatus={false} />
      <div className="flex-1">
        <div className="rounded-xl bg-secondary px-3 py-2">
          <p className="text-xs font-semibold text-foreground">{comment.author.name}</p>
          <p className="text-sm text-foreground">{comment.content}</p>
        </div>
        <div className="mt-1 flex items-center gap-3 px-1">
          <span className="text-[10px] text-muted-foreground">{comment.createdAt}</span>
          <button
            onClick={() => setLiked(!liked)}
            className={cn("flex items-center gap-1 text-[10px] font-medium", liked ? "text-red-500" : "text-muted-foreground")}
          >
            <Heart className={cn("h-3 w-3", liked && "fill-current")} />
            {comment.likes + (liked ? 1 : 0)}
          </button>
          <button className="text-[10px] font-medium text-muted-foreground">Reply</button>
        </div>
      </div>
    </div>
  )
}
