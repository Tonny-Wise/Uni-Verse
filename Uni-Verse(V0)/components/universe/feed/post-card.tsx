"use client"

import { useState } from "react"
import type { Post } from "@/lib/types"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { UniversityBadge } from "@/components/universe/shared/university-badge"
import { CommentSection } from "./comment-section"
import { cn } from "@/lib/utils"
import {
  Heart,
  MessageCircle,
  Share2,
  Bookmark,
  MoreHorizontal,
  Lightbulb,
  HelpCircle,
} from "lucide-react"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

interface PostCardProps {
  post: Post
}

const postTypeConfig = {
  "study-tip": { icon: Lightbulb, label: "Study Tip", className: "bg-universe-green/10 text-universe-green border-universe-green/20" },
  question: { icon: HelpCircle, label: "Question", className: "bg-universe-blue/10 text-universe-blue border-universe-blue/20" },
  text: null,
  image: null,
}

export function PostCard({ post }: PostCardProps) {
  const [liked, setLiked] = useState(post.isLiked)
  const [likeCount, setLikeCount] = useState(post.likes)
  const [bookmarked, setBookmarked] = useState(post.isBookmarked)
  const [showComments, setShowComments] = useState(false)

  const handleLike = () => {
    setLiked(!liked)
    setLikeCount((c) => (liked ? c - 1 : c + 1))
  }

  const typeConfig = postTypeConfig[post.type]

  return (
    <article className="border-b border-border bg-card">
      {/* Header */}
      <div className="flex items-start gap-3 px-4 pt-4">
        <UserAvatar
          src={post.author.avatar}
          name={post.author.name}
          isOnline={post.author.isOnline}
          size="md"
        />
        <div className="flex-1">
          <div className="flex items-center gap-2">
            <span className="text-sm font-semibold text-foreground">{post.author.name}</span>
            <UniversityBadge shortName={post.author.university.shortName} />
          </div>
          <p className="text-xs text-muted-foreground">
            @{post.author.username} &middot; {post.createdAt}
          </p>
        </div>
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <button className="rounded-full p-1 text-muted-foreground hover:bg-secondary hover:text-foreground" aria-label="More options">
              <MoreHorizontal className="h-5 w-5" />
            </button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end">
            <DropdownMenuItem>Save post</DropdownMenuItem>
            <DropdownMenuItem>Copy link</DropdownMenuItem>
            <DropdownMenuItem>Report</DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </div>

      {/* Type badge */}
      {typeConfig && (
        <div className="px-4 pt-2">
          <span className={cn("inline-flex items-center gap-1.5 rounded-full border px-2.5 py-0.5 text-xs font-medium", typeConfig.className)}>
            <typeConfig.icon className="h-3 w-3" />
            {typeConfig.label}
          </span>
        </div>
      )}

      {/* Content */}
      <div className="px-4 pt-2">
        <p className="text-sm leading-relaxed text-foreground whitespace-pre-line">{post.content}</p>
      </div>

      {/* Image */}
      {post.images.length > 0 && (
        <div className="mt-3 px-4">
          <div className="overflow-hidden rounded-xl border border-border">
            <img
              src={post.images[0]}
              alt="Post content"
              className="w-full object-cover"
              style={{ maxHeight: "400px" }}
              crossOrigin="anonymous"
            />
          </div>
        </div>
      )}

      {/* Stats */}
      <div className="flex items-center gap-4 px-4 pt-3 text-xs text-muted-foreground">
        <span>{likeCount.toLocaleString()} likes</span>
        <span>{post.comments.length} comments</span>
        <span>{post.shares} shares</span>
      </div>

      {/* Actions */}
      <div className="flex items-center border-t border-border mx-4 mt-2">
        <button
          onClick={handleLike}
          className={cn(
            "flex flex-1 items-center justify-center gap-2 py-2.5 text-sm font-medium transition-colors",
            liked ? "text-red-500" : "text-muted-foreground hover:text-foreground"
          )}
          aria-label={liked ? "Unlike" : "Like"}
        >
          <Heart className={cn("h-5 w-5", liked && "fill-current")} />
          <span className="hidden sm:inline">Like</span>
        </button>
        <button
          onClick={() => setShowComments(!showComments)}
          className="flex flex-1 items-center justify-center gap-2 py-2.5 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
          aria-label="Comment"
        >
          <MessageCircle className="h-5 w-5" />
          <span className="hidden sm:inline">Comment</span>
        </button>
        <button
          className="flex flex-1 items-center justify-center gap-2 py-2.5 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
          aria-label="Share"
        >
          <Share2 className="h-5 w-5" />
          <span className="hidden sm:inline">Share</span>
        </button>
        <button
          onClick={() => setBookmarked(!bookmarked)}
          className={cn(
            "flex items-center justify-center p-2.5 transition-colors",
            bookmarked ? "text-primary" : "text-muted-foreground hover:text-foreground"
          )}
          aria-label={bookmarked ? "Remove bookmark" : "Bookmark"}
        >
          <Bookmark className={cn("h-5 w-5", bookmarked && "fill-current")} />
        </button>
      </div>

      {/* Comments */}
      {showComments && <CommentSection comments={post.comments} />}
    </article>
  )
}
