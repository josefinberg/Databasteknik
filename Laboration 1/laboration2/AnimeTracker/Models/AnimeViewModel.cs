using System.ComponentModel.DataAnnotations;
namespace AnimeTracker.Models

{
    public class AnimeViewModel
    {
        [Required(ErrorMessage = "Titel måste fyllas i")]
        public string Title { get; set; } = "";
        [Range(1,10000,ErrorMessage = "Antal avsnitt måste vara minst 1")]
        public int TotalNrEpisodes{ get; set; }
        public string Genre { get; set; } = "";
        public List<string> Genres{ get; set; } = new List<string>
        {
            "Action",
            "Adventure",
            "Comedy",
            "Drama",
            "Fantasy",
            "Horror",
            "Mystery",
            "Romance",
            "Sci-Fi",
            "Slice of Life"
        };
        public bool IsFavorite{ get; set; }
    }
}