import { cn } from "@/lib/utils"

interface UniversityBadgeProps {
  shortName: string
  className?: string
}

export function UniversityBadge({ shortName, className }: UniversityBadgeProps) {
  return (
    <span
      className={cn(
        "inline-flex items-center rounded-full bg-primary/10 px-2 py-0.5 text-xs font-medium text-primary",
        className
      )}
    >
      {shortName}
    </span>
  )
}
