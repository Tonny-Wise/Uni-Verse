"use client"

import { useState } from "react"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { useAuth } from "@/lib/auth-context"
import { universities } from "@/lib/mock-data"
import { GraduationCap, Eye, EyeOff, Loader2 } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Checkbox } from "@/components/ui/checkbox"
import { toast } from "sonner"

export default function SignupPage() {
  const router = useRouter()
  const { signup } = useAuth()
  const [showPassword, setShowPassword] = useState(false)
  const [loading, setLoading] = useState(false)

  const [form, setForm] = useState({
    name: "", email: "", password: "", universityId: "", course: "", year: "1",
  })

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!form.name || !form.email || !form.password || !form.universityId || !form.course) {
      toast.error("Please fill in all required fields")
      return
    }
    setLoading(true)
    try {
      await signup({ ...form, year: parseInt(form.year) })
      toast.success("Welcome to Uni-Verse! Let's set up your profile.")
      router.push("/feed")
    } catch {
      toast.error("Something went wrong")
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="flex min-h-screen">
      {/* Left panel */}
      <div className="relative hidden flex-1 items-center justify-center bg-primary lg:flex">
        <div className="px-12 text-center">
          <div className="mb-8 flex justify-center">
            <div className="flex h-20 w-20 items-center justify-center rounded-2xl bg-primary-foreground/20">
              <GraduationCap className="h-12 w-12 text-primary-foreground" />
            </div>
          </div>
          <h2 className="mb-4 text-4xl font-bold text-primary-foreground">Join the Community</h2>
          <p className="text-lg text-primary-foreground/80 leading-relaxed">
            Connect with thousands of students from over 10 universities across Uganda. Study together, grow together.
          </p>
          <div className="mt-12 flex justify-center gap-8 text-primary-foreground/70">
            <div className="text-center">
              <p className="text-2xl font-bold text-primary-foreground">50K+</p>
              <p className="text-sm">Students</p>
            </div>
            <div className="text-center">
              <p className="text-2xl font-bold text-primary-foreground">10+</p>
              <p className="text-sm">Universities</p>
            </div>
            <div className="text-center">
              <p className="text-2xl font-bold text-primary-foreground">200+</p>
              <p className="text-sm">Groups</p>
            </div>
          </div>
        </div>
      </div>

      {/* Right panel - signup form */}
      <div className="flex flex-1 items-center justify-center bg-background px-4 py-12">
        <div className="w-full max-w-md">
          <div className="mb-8 flex items-center gap-2 lg:hidden">
            <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary">
              <GraduationCap className="h-6 w-6 text-primary-foreground" />
            </div>
            <span className="text-2xl font-bold text-foreground">Uni-Verse</span>
          </div>

          <h1 className="mb-2 text-2xl font-bold text-foreground">Create your account</h1>
          <p className="mb-8 text-muted-foreground">Join Uni-Verse and start connecting</p>

          <form onSubmit={handleSubmit} className="flex flex-col gap-4">
            <div className="flex flex-col gap-2">
              <Label htmlFor="name">Full name</Label>
              <Input
                id="name"
                placeholder="e.g. Sarah Namukasa"
                value={form.name}
                onChange={(e) => setForm({ ...form, name: e.target.value })}
              />
            </div>

            <div className="flex flex-col gap-2">
              <Label htmlFor="signup-email">Email address</Label>
              <Input
                id="signup-email"
                type="email"
                placeholder="you@university.ac.ug"
                value={form.email}
                onChange={(e) => setForm({ ...form, email: e.target.value })}
              />
            </div>

            <div className="flex flex-col gap-2">
              <Label htmlFor="signup-password">Password</Label>
              <div className="relative">
                <Input
                  id="signup-password"
                  type={showPassword ? "text" : "password"}
                  placeholder="Create a strong password"
                  value={form.password}
                  onChange={(e) => setForm({ ...form, password: e.target.value })}
                  className="pr-10"
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                  aria-label={showPassword ? "Hide password" : "Show password"}
                >
                  {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                </button>
              </div>
            </div>

            <div className="flex flex-col gap-2">
              <Label>University</Label>
              <Select value={form.universityId} onValueChange={(v) => setForm({ ...form, universityId: v })}>
                <SelectTrigger>
                  <SelectValue placeholder="Select your university" />
                </SelectTrigger>
                <SelectContent>
                  {universities.map((uni) => (
                    <SelectItem key={uni.id} value={uni.id}>
                      {uni.name} ({uni.shortName})
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            <div className="grid grid-cols-2 gap-3">
              <div className="flex flex-col gap-2">
                <Label htmlFor="course">Course / Program</Label>
                <Input
                  id="course"
                  placeholder="e.g. Computer Science"
                  value={form.course}
                  onChange={(e) => setForm({ ...form, course: e.target.value })}
                />
              </div>
              <div className="flex flex-col gap-2">
                <Label>Year of study</Label>
                <Select value={form.year} onValueChange={(v) => setForm({ ...form, year: v })}>
                  <SelectTrigger>
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {[1, 2, 3, 4, 5].map((y) => (
                      <SelectItem key={y} value={y.toString()}>Year {y}</SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
            </div>

            <div className="flex items-start gap-2">
              <Checkbox id="terms" className="mt-0.5" />
              <Label htmlFor="terms" className="text-sm text-muted-foreground font-normal leading-relaxed">
                {"I agree to the "}
                <a href="#" className="text-primary hover:underline">Terms of Service</a>
                {" and "}
                <a href="#" className="text-primary hover:underline">Privacy Policy</a>
              </Label>
            </div>

            <Button type="submit" className="w-full" disabled={loading}>
              {loading ? <Loader2 className="mr-2 h-4 w-4 animate-spin" /> : null}
              Create Account
            </Button>
          </form>

          <p className="mt-6 text-center text-sm text-muted-foreground">
            Already have an account?{" "}
            <Link href="/login" className="font-medium text-primary hover:underline">Log in</Link>
          </p>
        </div>
      </div>
    </div>
  )
}
