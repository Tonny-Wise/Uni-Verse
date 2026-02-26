"use client"

import Link from "next/link"
import { useAuth } from "@/lib/auth-context"
import { redirect } from "next/navigation"
import { universities } from "@/lib/mock-data"
import {
  GraduationCap,
  MessageCircle,
  Users,
  Video,
  BookOpen,
  Globe,
  ArrowRight,
  Sparkles,
  Shield,
  Zap,
} from "lucide-react"
import { Button } from "@/components/ui/button"

export default function LandingPage() {
  const { isAuthenticated } = useAuth()
  if (isAuthenticated) redirect("/feed")

  return (
    <div className="min-h-screen bg-background">
      {/* Header */}
      <header className="sticky top-0 z-50 border-b border-border bg-background/80 backdrop-blur-md">
        <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
          <div className="flex items-center gap-2">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-primary">
              <GraduationCap className="h-5 w-5 text-primary-foreground" />
            </div>
            <span className="text-xl font-bold text-foreground">Uni-Verse</span>
          </div>
          <nav className="hidden items-center gap-6 md:flex">
            <a href="#features" className="text-sm text-muted-foreground transition-colors hover:text-foreground">Features</a>
            <a href="#universities" className="text-sm text-muted-foreground transition-colors hover:text-foreground">Universities</a>
            <a href="#about" className="text-sm text-muted-foreground transition-colors hover:text-foreground">About</a>
          </nav>
          <div className="flex items-center gap-2">
            <Button variant="ghost" asChild>
              <Link href="/login">Log In</Link>
            </Button>
            <Button asChild>
              <Link href="/signup">Sign Up</Link>
            </Button>
          </div>
        </div>
      </header>

      {/* Hero */}
      <section className="relative overflow-hidden px-4 py-20 md:py-32">
        <div className="absolute inset-0 -z-10 bg-[radial-gradient(ellipse_at_top,var(--universe-green)/0.08,transparent_60%)]" />
        <div className="mx-auto max-w-6xl">
          <div className="mx-auto max-w-3xl text-center">
            <div className="mb-6 inline-flex items-center gap-2 rounded-full border border-primary/20 bg-primary/5 px-4 py-1.5 text-sm text-primary">
              <Sparkles className="h-4 w-4" />
              Connecting Ugandan University Students
            </div>
            <h1 className="mb-6 text-4xl font-bold leading-tight tracking-tight text-foreground text-balance md:text-6xl md:leading-tight">
              Your campus. Your community. <span className="text-primary">Your Uni-Verse.</span>
            </h1>
            <p className="mx-auto mb-10 max-w-2xl text-lg leading-relaxed text-muted-foreground text-pretty">
              The social platform built for Ugandan students. Connect with peers across every university, share study resources, join academic groups, and build your network -- all in one place.
            </p>
            <div className="flex flex-col items-center justify-center gap-3 sm:flex-row">
              <Button size="lg" className="w-full gap-2 sm:w-auto" asChild>
                <Link href="/signup">
                  Get Started Free
                  <ArrowRight className="h-4 w-4" />
                </Link>
              </Button>
              <Button size="lg" variant="outline" className="w-full sm:w-auto" asChild>
                <Link href="#features">Learn More</Link>
              </Button>
            </div>
          </div>

          {/* Stats */}
          <div className="mx-auto mt-16 grid max-w-2xl grid-cols-3 gap-8 text-center">
            <div>
              <p className="text-3xl font-bold text-foreground md:text-4xl">10+</p>
              <p className="mt-1 text-sm text-muted-foreground">Universities</p>
            </div>
            <div>
              <p className="text-3xl font-bold text-foreground md:text-4xl">50K+</p>
              <p className="mt-1 text-sm text-muted-foreground">Students</p>
            </div>
            <div>
              <p className="text-3xl font-bold text-foreground md:text-4xl">200+</p>
              <p className="mt-1 text-sm text-muted-foreground">Study Groups</p>
            </div>
          </div>
        </div>
      </section>

      {/* Features */}
      <section id="features" className="border-t border-border bg-card px-4 py-20">
        <div className="mx-auto max-w-6xl">
          <div className="mb-16 text-center">
            <h2 className="mb-4 text-3xl font-bold text-foreground">Everything you need in one app</h2>
            <p className="mx-auto max-w-xl text-muted-foreground">
              We combined the best features from the apps you already love into one unified platform for students.
            </p>
          </div>
          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
            {[
              { icon: BookOpen, title: "Smart Feed", desc: "Share study tips, ask questions, and post updates. Filter by university, course, or topic.", color: "text-primary" },
              { icon: MessageCircle, title: "Instant Messaging", desc: "Chat one-on-one or in groups. Share files, voice notes, and study materials instantly.", color: "text-accent" },
              { icon: Users, title: "University Groups", desc: "Join course-specific groups, student clubs, and inter-university communities.", color: "text-primary" },
              { icon: Video, title: "Video Calls", desc: "Host study sessions, project meetings, and virtual lectures with built-in video calls.", color: "text-accent" },
              { icon: Globe, title: "Cross-University", desc: "Connect with students from Makerere, Kyambogo, UCU, MUBS, and more.", color: "text-primary" },
              { icon: Sparkles, title: "Stories", desc: "Share moments from campus life. Class highlights, events, and daily vibes.", color: "text-accent" },
            ].map((f) => (
              <div key={f.title} className="group rounded-xl border border-border bg-background p-6 transition-all hover:border-primary/30 hover:shadow-md">
                <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-lg bg-primary/10">
                  <f.icon className={`h-6 w-6 ${f.color}`} />
                </div>
                <h3 className="mb-2 text-lg font-semibold text-foreground">{f.title}</h3>
                <p className="text-sm leading-relaxed text-muted-foreground">{f.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Universities */}
      <section id="universities" className="px-4 py-20">
        <div className="mx-auto max-w-6xl">
          <div className="mb-16 text-center">
            <h2 className="mb-4 text-3xl font-bold text-foreground">Trusted by students across Uganda</h2>
            <p className="mx-auto max-w-xl text-muted-foreground">
              Students from the top universities and institutions across Uganda are already on Uni-Verse.
            </p>
          </div>
          <div className="grid grid-cols-2 gap-4 md:grid-cols-5">
            {universities.map((uni) => (
              <div key={uni.id} className="flex flex-col items-center gap-2 rounded-xl border border-border bg-card p-4 text-center transition-all hover:border-primary/30 hover:shadow-sm">
                <div className="flex h-14 w-14 items-center justify-center rounded-full bg-primary/10">
                  <GraduationCap className="h-7 w-7 text-primary" />
                </div>
                <p className="text-sm font-medium text-foreground">{uni.shortName}</p>
                <p className="text-xs text-muted-foreground">{uni.location}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Why Uni-Verse */}
      <section id="about" className="border-t border-border bg-card px-4 py-20">
        <div className="mx-auto max-w-6xl">
          <div className="grid items-center gap-12 lg:grid-cols-2">
            <div>
              <h2 className="mb-6 text-3xl font-bold text-foreground">Built for the Ugandan student experience</h2>
              <p className="mb-8 text-muted-foreground leading-relaxed">
                Uni-Verse is more than just another social media app. It is a platform designed specifically for the unique needs of university students in Uganda -- from sharing lecture notes to organizing study groups across institutions.
              </p>
              <div className="flex flex-col gap-4">
                {[
                  { icon: Shield, label: "Safe and verified student community" },
                  { icon: Zap, label: "Optimized for low bandwidth connections" },
                  { icon: Globe, label: "Cross-university collaboration" },
                ].map((item) => (
                  <div key={item.label} className="flex items-center gap-3">
                    <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary/10">
                      <item.icon className="h-5 w-5 text-primary" />
                    </div>
                    <p className="text-sm font-medium text-foreground">{item.label}</p>
                  </div>
                ))}
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="flex flex-col gap-4">
                <div className="rounded-xl bg-primary/10 p-6">
                  <p className="text-3xl font-bold text-primary">4.8</p>
                  <p className="mt-1 text-sm text-muted-foreground">Average rating</p>
                </div>
                <div className="rounded-xl bg-accent/10 p-6">
                  <p className="text-3xl font-bold text-accent">98%</p>
                  <p className="mt-1 text-sm text-muted-foreground">Student satisfaction</p>
                </div>
              </div>
              <div className="flex flex-col gap-4 pt-8">
                <div className="rounded-xl bg-accent/10 p-6">
                  <p className="text-3xl font-bold text-accent">24/7</p>
                  <p className="mt-1 text-sm text-muted-foreground">Active community</p>
                </div>
                <div className="rounded-xl bg-primary/10 p-6">
                  <p className="text-3xl font-bold text-primary">Free</p>
                  <p className="mt-1 text-sm text-muted-foreground">For all students</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="px-4 py-20">
        <div className="mx-auto max-w-3xl text-center">
          <h2 className="mb-4 text-3xl font-bold text-foreground">Ready to join the Uni-Verse?</h2>
          <p className="mb-8 text-muted-foreground">Sign up today and connect with thousands of students across Uganda.</p>
          <Button size="lg" className="gap-2" asChild>
            <Link href="/signup">
              Create Your Account
              <ArrowRight className="h-4 w-4" />
            </Link>
          </Button>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-border bg-card px-4 py-10">
        <div className="mx-auto flex max-w-6xl flex-col items-center justify-between gap-4 md:flex-row">
          <div className="flex items-center gap-2">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary">
              <GraduationCap className="h-4 w-4 text-primary-foreground" />
            </div>
            <span className="font-bold text-foreground">Uni-Verse</span>
          </div>
          <p className="text-sm text-muted-foreground">Built with love for Ugandan students.</p>
          <div className="flex gap-6">
            <a href="#" className="text-sm text-muted-foreground hover:text-foreground">Privacy</a>
            <a href="#" className="text-sm text-muted-foreground hover:text-foreground">Terms</a>
            <a href="#" className="text-sm text-muted-foreground hover:text-foreground">Contact</a>
          </div>
        </div>
      </footer>
    </div>
  )
}
