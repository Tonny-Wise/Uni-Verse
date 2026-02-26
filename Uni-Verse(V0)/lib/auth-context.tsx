"use client"

import { createContext, useContext, useState, useCallback, type ReactNode } from "react"
import { currentUser } from "./mock-data"
import type { User } from "./types"

interface AuthContextType {
  user: User | null
  isAuthenticated: boolean
  login: (email: string, password: string) => Promise<void>
  signup: (data: SignupData) => Promise<void>
  logout: () => void
}

interface SignupData {
  name: string
  email: string
  password: string
  universityId: string
  course: string
  year: number
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(currentUser)

  const login = useCallback(async (_email: string, _password: string) => {
    await new Promise((r) => setTimeout(r, 800))
    setUser(currentUser)
  }, [])

  const signup = useCallback(async (_data: SignupData) => {
    await new Promise((r) => setTimeout(r, 800))
    setUser(currentUser)
  }, [])

  const logout = useCallback(() => {
    setUser(null)
  }, [])

  return (
    <AuthContext.Provider value={{ user, isAuthenticated: !!user, login, signup, logout }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) throw new Error("useAuth must be used within AuthProvider")
  return context
}
