import type { MetaFunction } from "@remix-run/cloudflare";
import { Button } from "@/components/ui/button";

export const meta: MetaFunction = () => {
  return [
    { title: "Deck Builder" },
    {
      name: "A pokemon tcg deck builder",
      content: "pokemon tcg deck builder",
    },
  ];
};

export default function Index() {
  return (
    <div className="font-sans p-4">
      <Button>Click pls</Button> 
    </div>
  );
}
