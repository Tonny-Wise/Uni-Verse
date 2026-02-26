"use client"

import { useState, useEffect, useCallback } from "react"
import type { Story } from "@/lib/types"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { X, ChevronLeft, ChevronRight } from "lucide-react"
import { cn } from "@/lib/utils"

interface StoryViewerProps {
  stories: Story[]
  initialIndex: number
  onClose: () => void
}

export function StoryViewer({ stories, initialIndex, onClose }: StoryViewerProps) {
  const [storyIndex, setStoryIndex] = useState(initialIndex)
  const [slideIndex, setSlideIndex] = useState(0)
  const [progress, setProgress] = useState(0)

  const currentStory = stories[storyIndex]
  const currentSlide = currentStory?.slides[slideIndex]

  const goNext = useCallback(() => {
    if (slideIndex < currentStory.slides.length - 1) {
      setSlideIndex((s) => s + 1)
      setProgress(0)
    } else if (storyIndex < stories.length - 1) {
      setStoryIndex((s) => s + 1)
      setSlideIndex(0)
      setProgress(0)
    } else {
      onClose()
    }
  }, [slideIndex, storyIndex, currentStory, stories.length, onClose])

  const goPrev = useCallback(() => {
    if (slideIndex > 0) {
      setSlideIndex((s) => s - 1)
      setProgress(0)
    } else if (storyIndex > 0) {
      setStoryIndex((s) => s - 1)
      setSlideIndex(0)
      setProgress(0)
    }
  }, [slideIndex, storyIndex])

  useEffect(() => {
    const interval = setInterval(() => {
      setProgress((p) => {
        if (p >= 100) {
          goNext()
          return 0
        }
        return p + 2
      })
    }, 80)
    return () => clearInterval(interval)
  }, [goNext])

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose()
      if (e.key === "ArrowRight") goNext()
      if (e.key === "ArrowLeft") goPrev()
    }
    window.addEventListener("keydown", handler)
    return () => window.removeEventListener("keydown", handler)
  }, [onClose, goNext, goPrev])

  if (!currentSlide) return null

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center bg-foreground/95">
      {/* Progress bars */}
      <div className="absolute left-0 right-0 top-0 z-10 flex gap-1 px-3 pt-3">
        {currentStory.slides.map((slide, i) => (
          <div key={slide.id} className="h-0.5 flex-1 rounded-full bg-primary-foreground/30">
            <div
              className={cn("h-full rounded-full bg-primary-foreground transition-all duration-100")}
              style={{
                width: i < slideIndex ? "100%" : i === slideIndex ? `${progress}%` : "0%",
              }}
            />
          </div>
        ))}
      </div>

      {/* Author info */}
      <div className="absolute left-0 right-0 top-0 z-10 flex items-center gap-3 px-4 pt-6">
        <UserAvatar src={currentStory.author.avatar} name={currentStory.author.name} size="sm" showStatus={false} />
        <div className="flex-1">
          <p className="text-sm font-semibold text-primary-foreground">{currentStory.author.name}</p>
          <p className="text-xs text-primary-foreground/60">{currentSlide.createdAt}</p>
        </div>
        <button onClick={onClose} className="rounded-full p-1 text-primary-foreground/80 hover:text-primary-foreground" aria-label="Close story">
          <X className="h-6 w-6" />
        </button>
      </div>

      {/* Story image */}
      <div className="relative h-full w-full max-w-lg">
        <img
          src={currentSlide.image}
          alt={currentSlide.caption || "Story"}
          className="h-full w-full object-cover"
          crossOrigin="anonymous"
        />

        {/* Caption */}
        {currentSlide.caption && (
          <div className="absolute bottom-16 left-0 right-0 px-6 text-center">
            <p className="rounded-lg bg-foreground/50 px-4 py-2 text-sm font-medium text-primary-foreground backdrop-blur-sm">
              {currentSlide.caption}
            </p>
          </div>
        )}

        {/* Navigation areas */}
        <button
          onClick={goPrev}
          className="absolute left-0 top-0 h-full w-1/3"
          aria-label="Previous"
        />
        <button
          onClick={goNext}
          className="absolute right-0 top-0 h-full w-1/3"
          aria-label="Next"
        />
      </div>

      {/* Desktop nav arrows */}
      <button
        onClick={goPrev}
        className="absolute left-4 hidden rounded-full bg-card/20 p-2 text-primary-foreground backdrop-blur-sm hover:bg-card/40 md:block"
        aria-label="Previous story"
      >
        <ChevronLeft className="h-6 w-6" />
      </button>
      <button
        onClick={goNext}
        className="absolute right-4 hidden rounded-full bg-card/20 p-2 text-primary-foreground backdrop-blur-sm hover:bg-card/40 md:block"
        aria-label="Next story"
      >
        <ChevronRight className="h-6 w-6" />
      </button>
    </div>
  )
}
