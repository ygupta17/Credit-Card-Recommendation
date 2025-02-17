import Supabase
import Foundation

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://lurzbeyzkhiygalkbveg.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx1cnpiZXl6a2hpeWdhbGtidmVnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk3NTE3NTksImV4cCI6MjA1NTMyNzc1OX0.iRYoi1aGO-AGTB-_XJpr6z_KhdqppTRzXZyENdX_ZV0"
)

struct Instrument: Decodable, Identifiable {
  let id: Int
  let name: String
}
