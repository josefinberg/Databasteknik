namespace AnimeTracker.Models
{
    public class Anime
    {
       public int AnimeId {get;set;}
       public string Title {get;set;} ="";
       public int TotalNrEpisodes {get;set;}
       public string Genre {get;set;} ="";
       public bool IsFavorite {get;set;} 
       public bool HasWatched {get;set;}
    }
}

