import { Link } from "@remix-run/react"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"

export default function Navbar() {
    return (
        <nav className="flex justify-between items-center py-2 px-4 bg-slate-900 text-white">
            <Link to="/">Deck Builder</Link>
            <Avatar>
                <AvatarImage src="https://github.com/shadcn.png" />
                <AvatarFallback>CN</AvatarFallback>
            </Avatar>
        </nav>
    )
}