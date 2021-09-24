terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  auth_server = "https://oauth2.conrad.cafe"
  api_key = var.spotify_api_key
  username = "micaela.lisi"
  token_id = "dc21acd5-ed7b-45cd-943c-83253dc5bb11"
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Micaela Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = flatten([
    data.spotify_search_track.search.tracks[0].id,
  ])
}


data "spotify_search_track" "search" {
  name   = "Somebody Told Me"
  artist = "The Killers"
  album  = "Hot Fuss"
}

output "test" {
  value = data.spotify_search_track.search.tracks
}