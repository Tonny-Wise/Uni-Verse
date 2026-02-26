"use client"

import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { cn } from "@/lib/utils"

interface UserAvatarProps {
  src: string
  name: string
  isOnline?: boolean
  size?: "sm" | "md" | "lg" | "xl"
  className?: string
  showStatus?: boolean
}

const sizeMap = {
  sm: "h-8 w-8",
  md: "h-10 w-10",
  lg: "h-12 w-12",
  xl: "h-20 w-20",
}

const statusSizeMap = {
  sm: "h-2.5 w-2.5 border",
  md: "h-3 w-3 border-2",
  lg: "h-3.5 w-3.5 border-2",
  xl: "h-5 w-5 border-2",
}

export function UserAvatar({ src, name, isOnline, size = "md", className, showStatus = true }: UserAvatarProps) {
  const initials = name.split(" ").map((n) => n[0]).join("").slice(0, 2).toUpperCase()

  return (
    <div className="relative inline-flex shrink-0">
      <Avatar className={cn(sizeMap[size], className)}>
        <AvatarImage src={src} alt={name} />
        <AvatarFallback className="bg-primary/10 text-primary text-xs font-medium">{initials}</AvatarFallback>
      </Avatar>
      {showStatus && isOnline && (
        <span
          className={cn(
            "absolute bottom-0 right-0 rounded-full bg-online border-background",
            statusSizeMap[size]
          )}
          aria-label="Online"
        />
      )}
    </div>
  )
}
