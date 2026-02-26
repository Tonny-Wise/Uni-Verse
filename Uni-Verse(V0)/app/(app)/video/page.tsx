"use client"

import Link from "next/link"
import { videoCalls, currentUser } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { Button } from "@/components/ui/button"
import { Video, Plus, Clock, Radio, Phone } from "lucide-react"
import { cn } from "@/lib/utils"

const statusConfig = {
  live: { label: "Live Now", className: "bg-red-500/10 text-red-500 border-red-500/20", icon: Radio },
  scheduled: { label: "Scheduled", className: "bg-primary/10 text-primary border-primary/20", icon: Clock },
  ended: { label: "Ended", className: "bg-muted text-muted-foreground border-border", icon: Phone },
}

export default function VideoPage() {
  return (
    <div className="mx-auto max-w-3xl">
      {/* Header */}
      <div className="border-b border-border bg-card px-4 py-3">
        <div className="flex items-center justify-between">
          <h1 className="text-xl font-bold text-foreground">Video Calls</h1>
          <Link href="/video/new">
            <Button size="sm" className="gap-1.5">
              <Plus className="h-4 w-4" />
              New Call
            </Button>
          </Link>
        </div>
      </div>

      {/* Quick actions */}
      <div className="grid grid-cols-2 gap-3 px-4 py-4">
        <Link href="/video/new" className="flex items-center gap-3 rounded-xl border border-border bg-card p-4 transition-colors hover:border-primary/30">
          <div className="flex h-10 w-10 items-center justify-center rounded-full bg-primary/10">
            <Video className="h-5 w-5 text-primary" />
          </div>
          <div>
            <p className="text-sm font-semibold text-foreground">Start Call</p>
            <p className="text-xs text-muted-foreground">Begin instantly</p>
          </div>
        </Link>
        <button className="flex items-center gap-3 rounded-xl border border-border bg-card p-4 transition-colors hover:border-primary/30">
          <div className="flex h-10 w-10 items-center justify-center rounded-full bg-accent/10">
            <Clock className="h-5 w-5 text-accent" />
          </div>
          <div className="text-left">
            <p className="text-sm font-semibold text-foreground">Schedule</p>
            <p className="text-xs text-muted-foreground">Plan ahead</p>
          </div>
        </button>
      </div>

      {/* Calls list */}
      <div className="px-4 pb-4">
        <h2 className="mb-3 text-sm font-semibold text-muted-foreground uppercase tracking-wide">Calls</h2>
        <div className="flex flex-col gap-3">
          {videoCalls.map((call) => {
            const config = statusConfig[call.status]
            return (
              <Link
                key={call.id}
                href={`/video/${call.id}`}
                className="rounded-xl border border-border bg-card p-4 transition-all hover:border-primary/30 hover:shadow-sm"
              >
                <div className="flex items-start justify-between gap-3">
                  <div className="flex-1">
                    <div className="flex items-center gap-2">
                      <h3 className="text-sm font-semibold text-foreground">{call.title}</h3>
                      <span className={cn("inline-flex items-center gap-1 rounded-full border px-2 py-0.5 text-[10px] font-medium", config.className)}>
                        <config.icon className="h-2.5 w-2.5" />
                        {config.label}
                      </span>
                    </div>
                    <p className="mt-1 text-xs text-muted-foreground">
                      Hosted by {call.host.id === currentUser.id ? "you" : call.host.name} &middot; {call.scheduledAt}
                    </p>
                    {call.duration && (
                      <p className="mt-0.5 text-xs text-muted-foreground">Duration: {call.duration}</p>
                    )}
                  </div>
                  {call.status === "live" && (
                    <Button size="sm" variant="destructive" className="shrink-0">Join</Button>
                  )}
                </div>

                {/* Participants */}
                <div className="mt-3 flex items-center gap-2">
                  <div className="flex -space-x-2">
                    {call.participants.slice(0, 4).map((p) => (
                      <UserAvatar key={p.id} src={p.avatar} name={p.name} size="sm" showStatus={false} className="border-2 border-card" />
                    ))}
                  </div>
                  <span className="text-xs text-muted-foreground">{call.participants.length} participants</span>
                </div>
              </Link>
            )
          })}
        </div>
      </div>
    </div>
  )
}
