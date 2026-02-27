"use client"

import { useState, use } from "react"
import { useRouter } from "next/navigation"
import { videoCalls, currentUser } from "@/lib/mock-data"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import {
  Mic, MicOff, VideoIcon, VideoOff, MonitorUp, MessageCircle, Users,
  Phone, MoreHorizontal, Maximize2,
} from "lucide-react"
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { toast } from "sonner"

export default function VideoCallPage({ params }: { params: Promise<{ callId: string }> }) {
  const { callId } = use(params)
  const router = useRouter()
  const call = videoCalls.find((c) => c.id === callId)
  const [micOn, setMicOn] = useState(true)
  const [camOn, setCamOn] = useState(true)

  if (!call) {
    return (
      <div className="flex h-[80vh] items-center justify-center">
        <p className="text-muted-foreground">Call not found</p>
      </div>
    )
  }

  const participants = call.participants
  const gridCols = participants.length <= 2 ? "grid-cols-1 md:grid-cols-2" : "grid-cols-2"

  const handleEnd = () => {
    toast.success("Call ended")
    router.push("/video")
  }

  return (
    <div className="flex h-[calc(100vh-64px)] flex-col bg-foreground lg:h-screen">
      {/* Header */}
      <div className="flex items-center justify-between px-4 py-2">
        <div>
          <h2 className="text-sm font-semibold text-primary-foreground">{call.title}</h2>
          <p className="text-xs text-primary-foreground/60">{call.duration || "00:00"}</p>
        </div>
        <div className="flex items-center gap-2">
          <Button variant="ghost" size="icon" className="h-8 w-8 text-primary-foreground/60 hover:text-primary-foreground hover:bg-primary-foreground/10">
            <Maximize2 className="h-4 w-4" />
          </Button>
          <Button variant="ghost" size="icon" className="h-8 w-8 text-primary-foreground/60 hover:text-primary-foreground hover:bg-primary-foreground/10">
            <MoreHorizontal className="h-4 w-4" />
          </Button>
        </div>
      </div>

      {/* Video grid */}
      <div className="flex-1 p-3">
        <div className={cn("grid h-full gap-2", gridCols)}>
          {participants.map((participant) => (
            <div
              key={participant.id}
              className="relative flex items-center justify-center overflow-hidden rounded-xl bg-card/10"
            >
              {/* Simulated video with avatar */}
              <div className="flex flex-col items-center gap-3">
                <UserAvatar
                  src={participant.avatar}
                  name={participant.name}
                  size="xl"
                  showStatus={false}
                />
                {!camOn && participant.id === currentUser.id && (
                  <div className="absolute inset-0 flex items-center justify-center bg-card/20 backdrop-blur-sm">
                    <VideoOff className="h-8 w-8 text-primary-foreground/60" />
                  </div>
                )}
              </div>

              {/* Name label */}
              <div className="absolute bottom-2 left-2 flex items-center gap-1.5 rounded-md bg-foreground/60 px-2 py-1 backdrop-blur-sm">
                <span className="text-xs font-medium text-primary-foreground">
                  {participant.id === currentUser.id ? "You" : participant.name.split(" ")[0]}
                </span>
                {participant.id !== currentUser.id && (
                  <Mic className="h-3 w-3 text-primary-foreground/60" />
                )}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Controls */}
      <div className="flex items-center justify-center gap-3 px-4 py-4">
        <button
          onClick={() => setMicOn(!micOn)}
          className={cn(
            "flex h-12 w-12 items-center justify-center rounded-full transition-colors",
            micOn ? "bg-primary-foreground/10 text-primary-foreground" : "bg-red-500 text-primary-foreground"
          )}
          aria-label={micOn ? "Mute microphone" : "Unmute microphone"}
        >
          {micOn ? <Mic className="h-5 w-5" /> : <MicOff className="h-5 w-5" />}
        </button>
        <button
          onClick={() => setCamOn(!camOn)}
          className={cn(
            "flex h-12 w-12 items-center justify-center rounded-full transition-colors",
            camOn ? "bg-primary-foreground/10 text-primary-foreground" : "bg-red-500 text-primary-foreground"
          )}
          aria-label={camOn ? "Turn off camera" : "Turn on camera"}
        >
          {camOn ? <VideoIcon className="h-5 w-5" /> : <VideoOff className="h-5 w-5" />}
        </button>
        <button
          className="flex h-12 w-12 items-center justify-center rounded-full bg-primary-foreground/10 text-primary-foreground transition-colors hover:bg-primary-foreground/20"
          aria-label="Share screen"
        >
          <MonitorUp className="h-5 w-5" />
        </button>
        <button
          className="flex h-12 w-12 items-center justify-center rounded-full bg-primary-foreground/10 text-primary-foreground transition-colors hover:bg-primary-foreground/20"
          aria-label="Chat"
        >
          <MessageCircle className="h-5 w-5" />
        </button>
        <button
          className="flex h-12 w-12 items-center justify-center rounded-full bg-primary-foreground/10 text-primary-foreground transition-colors hover:bg-primary-foreground/20"
          aria-label="Participants"
        >
          <Users className="h-5 w-5" />
        </button>
        <button
          onClick={handleEnd}
          className="flex h-12 w-16 items-center justify-center rounded-full bg-red-500 text-primary-foreground transition-colors hover:bg-red-600"
          aria-label="End call"
        >
          <Phone className="h-5 w-5 rotate-[135deg]" />
        </button>
      </div>
    </div>
  )
}
