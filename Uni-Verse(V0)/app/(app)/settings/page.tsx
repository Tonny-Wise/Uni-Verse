"use client"

import { useState } from "react"
import { useAuth } from "@/lib/auth-context"
import { useTheme } from "next-themes"
import { UserAvatar } from "@/components/universe/shared/user-avatar"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Switch } from "@/components/ui/switch"
import { Textarea } from "@/components/ui/textarea"
import { toast } from "sonner"
import {
  User,
  Bell,
  Lock,
  Palette,
  Globe,
  Shield,
  HelpCircle,
  LogOut,
  ChevronRight,
  Moon,
  Sun,
  Monitor,
  GraduationCap,
} from "lucide-react"
import { cn } from "@/lib/utils"
import { useRouter } from "next/navigation"

const settingsSections = [
  { id: "account", label: "Account", icon: User, description: "Profile, university, personal info" },
  { id: "notifications", label: "Notifications", icon: Bell, description: "Push, email, in-app alerts" },
  { id: "privacy", label: "Privacy", icon: Lock, description: "Visibility, blocking, data" },
  { id: "appearance", label: "Appearance", icon: Palette, description: "Theme, display, accessibility" },
  { id: "language", label: "Language", icon: Globe, description: "App language and region" },
  { id: "security", label: "Security", icon: Shield, description: "Password, two-factor auth" },
  { id: "help", label: "Help & Support", icon: HelpCircle, description: "FAQ, contact, report a bug" },
]

export default function SettingsPage() {
  const { user, logout } = useAuth()
  const { theme, setTheme } = useTheme()
  const router = useRouter()
  const [activeSection, setActiveSection] = useState<string | null>(null)

  if (!user) return null

  const handleLogout = () => {
    logout()
    router.push("/")
  }

  if (!activeSection) {
    return (
      <div className="mx-auto max-w-3xl">
        <div className="border-b border-border bg-card px-4 py-4">
          <h1 className="text-lg font-bold text-foreground">Settings</h1>
          <p className="text-xs text-muted-foreground">Manage your account and preferences</p>
        </div>

        {/* User card */}
        <div className="border-b border-border bg-card px-4 py-4">
          <div className="flex items-center gap-3">
            <UserAvatar src={user.avatar} name={user.name} isOnline size="lg" />
            <div className="flex-1 min-w-0">
              <p className="text-sm font-semibold text-foreground">{user.name}</p>
              <p className="text-xs text-muted-foreground">@{user.username}</p>
              <div className="mt-1 flex items-center gap-1.5 text-xs text-muted-foreground">
                <GraduationCap className="h-3 w-3" />
                {user.university.shortName} &middot; {user.course}
              </div>
            </div>
            <Button variant="outline" size="sm" onClick={() => router.push("/profile")}>
              View Profile
            </Button>
          </div>
        </div>

        {/* Sections */}
        <div className="flex flex-col">
          {settingsSections.map((section) => (
            <button
              key={section.id}
              onClick={() => setActiveSection(section.id)}
              className="flex items-center gap-3 border-b border-border px-4 py-3.5 text-left hover:bg-secondary/50 transition-colors"
            >
              <span className="flex h-9 w-9 items-center justify-center rounded-lg bg-secondary">
                <section.icon className="h-4.5 w-4.5 text-foreground" />
              </span>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-foreground">{section.label}</p>
                <p className="text-xs text-muted-foreground">{section.description}</p>
              </div>
              <ChevronRight className="h-4 w-4 text-muted-foreground" />
            </button>
          ))}
        </div>

        {/* Logout */}
        <div className="px-4 py-6">
          <Button variant="destructive" className="w-full gap-2" onClick={handleLogout}>
            <LogOut className="h-4 w-4" />
            Log Out
          </Button>
          <p className="mt-3 text-center text-xs text-muted-foreground">
            Uni-Verse v1.0 &middot; Connecting Ugandan students
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-3xl">
      {/* Back header */}
      <div className="sticky top-0 z-10 flex items-center gap-3 border-b border-border bg-card/95 backdrop-blur-md px-4 py-3">
        <button
          onClick={() => setActiveSection(null)}
          className="flex h-8 w-8 items-center justify-center rounded-full hover:bg-secondary transition-colors"
          aria-label="Go back"
        >
          <ChevronRight className="h-4 w-4 rotate-180 text-foreground" />
        </button>
        <h1 className="text-base font-bold text-foreground">
          {settingsSections.find((s) => s.id === activeSection)?.label}
        </h1>
      </div>

      {/* Account settings */}
      {activeSection === "account" && <AccountSettings user={user} />}

      {/* Notifications settings */}
      {activeSection === "notifications" && <NotificationSettings />}

      {/* Privacy settings */}
      {activeSection === "privacy" && <PrivacySettings />}

      {/* Appearance settings */}
      {activeSection === "appearance" && <AppearanceSettings theme={theme} setTheme={setTheme} />}

      {/* Other sections (placeholder) */}
      {["language", "security", "help"].includes(activeSection) && (
        <div className="px-4 py-16 text-center">
          <HelpCircle className="mx-auto h-12 w-12 text-muted-foreground/40" />
          <p className="mt-3 text-sm font-medium text-foreground">Coming soon</p>
          <p className="mt-1 text-xs text-muted-foreground">This section is under development</p>
        </div>
      )}
    </div>
  )
}

function AccountSettings({ user }: { user: NonNullable<ReturnType<typeof useAuth>["user"]> }) {
  return (
    <div className="px-4 py-5 flex flex-col gap-5">
      <div className="flex items-center gap-4">
        <UserAvatar src={user.avatar} name={user.name} size="lg" showStatus={false} />
        <Button variant="outline" size="sm">Change Photo</Button>
      </div>
      <div className="flex flex-col gap-2">
        <Label htmlFor="s-name">Full Name</Label>
        <Input id="s-name" defaultValue={user.name} />
      </div>
      <div className="flex flex-col gap-2">
        <Label htmlFor="s-username">Username</Label>
        <Input id="s-username" defaultValue={user.username} />
      </div>
      <div className="flex flex-col gap-2">
        <Label htmlFor="s-email">Email</Label>
        <Input id="s-email" type="email" defaultValue="sarah.namukasa@mak.ac.ug" />
      </div>
      <div className="flex flex-col gap-2">
        <Label htmlFor="s-bio">Bio</Label>
        <Textarea id="s-bio" defaultValue={user.bio} rows={3} className="resize-none" />
      </div>
      <div className="flex flex-col gap-2">
        <Label htmlFor="s-course">Course</Label>
        <Input id="s-course" defaultValue={user.course} />
      </div>
      <div className="flex flex-col gap-2">
        <Label>University</Label>
        <Input defaultValue={user.university.name} disabled className="bg-muted" />
        <p className="text-xs text-muted-foreground">Contact support to change your university</p>
      </div>
      <Button onClick={() => toast.success("Account updated successfully!")}>Save Changes</Button>
    </div>
  )
}

function NotificationSettings() {
  return (
    <div className="flex flex-col">
      <SettingsToggle label="Push Notifications" description="Receive push notifications on your device" defaultChecked />
      <SettingsToggle label="Email Notifications" description="Receive email notifications for important updates" defaultChecked />
      <SettingsToggle label="New Followers" description="Notify when someone follows you" defaultChecked />
      <SettingsToggle label="Likes" description="Notify when someone likes your post" defaultChecked />
      <SettingsToggle label="Comments" description="Notify when someone comments on your post" defaultChecked />
      <SettingsToggle label="Mentions" description="Notify when someone mentions you" defaultChecked />
      <SettingsToggle label="Group Activity" description="Notify for new posts in your groups" defaultChecked={false} />
      <SettingsToggle label="Video Call Invites" description="Notify for incoming video call invitations" defaultChecked />
      <SettingsToggle label="Message Previews" description="Show message content in notifications" defaultChecked />
    </div>
  )
}

function PrivacySettings() {
  return (
    <div className="flex flex-col">
      <SettingsToggle label="Private Profile" description="Only approved followers can see your posts" defaultChecked={false} />
      <SettingsToggle label="Show Online Status" description="Let others see when you are online" defaultChecked />
      <SettingsToggle label="Show Read Receipts" description="Let others see when you have read their messages" defaultChecked />
      <SettingsToggle label="Allow Search Indexing" description="Appear in search results on Uni-Verse" defaultChecked />
      <SettingsToggle label="Show University" description="Display your university on your profile" defaultChecked />
      <SettingsToggle label="Allow Direct Messages" description="Let anyone send you direct messages" defaultChecked />
    </div>
  )
}

function AppearanceSettings({ theme, setTheme }: { theme: string | undefined; setTheme: (t: string) => void }) {
  const themes = [
    { id: "light", label: "Light", icon: Sun },
    { id: "dark", label: "Dark", icon: Moon },
    { id: "system", label: "System", icon: Monitor },
  ]

  return (
    <div className="px-4 py-5">
      <p className="text-sm font-medium text-foreground mb-3">Theme</p>
      <div className="flex gap-2">
        {themes.map((t) => (
          <button
            key={t.id}
            onClick={() => setTheme(t.id)}
            className={cn(
              "flex flex-1 flex-col items-center gap-2 rounded-lg border p-4 transition-colors",
              theme === t.id
                ? "border-primary bg-primary/5 text-primary"
                : "border-border text-muted-foreground hover:bg-secondary"
            )}
          >
            <t.icon className="h-6 w-6" />
            <span className="text-xs font-medium">{t.label}</span>
          </button>
        ))}
      </div>

      <div className="mt-6">
        <p className="text-sm font-medium text-foreground mb-3">Text Size</p>
        <div className="flex items-center gap-4">
          <span className="text-xs text-muted-foreground">A</span>
          <div className="flex-1 h-1.5 rounded-full bg-secondary relative">
            <div className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-4 w-4 rounded-full bg-primary border-2 border-card" />
          </div>
          <span className="text-lg text-muted-foreground font-medium">A</span>
        </div>
      </div>
    </div>
  )
}

function SettingsToggle({ label, description, defaultChecked }: { label: string; description: string; defaultChecked: boolean }) {
  const [checked, setChecked] = useState(defaultChecked)
  return (
    <div className="flex items-center justify-between border-b border-border px-4 py-3.5">
      <div className="flex-1 mr-4">
        <p className="text-sm font-medium text-foreground">{label}</p>
        <p className="text-xs text-muted-foreground">{description}</p>
      </div>
      <Switch checked={checked} onCheckedChange={setChecked} />
    </div>
  )
}
