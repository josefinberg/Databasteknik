using Microsoft.AspNetCore.Mvc;
using AnimeTracker.Models;


namespace AnimeTracker.Controllers
{
    public class AnimeController : Controller
    {
        private static List<Anime> animeList = new List<Anime>
        {
            new Anime { AnimeId = 1,  Title = "Jujutsu Kaisen", TotalNrEpisodes = 47, HasWatched = true },
            new Anime { AnimeId = 2,  Title = "Naruto", TotalNrEpisodes = 220 },
            new Anime { AnimeId = 3,  Title = "One Piece", TotalNrEpisodes = 1000, HasWatched = true },
            new Anime { AnimeId = 4,  Title = "Attack on Titan", TotalNrEpisodes = 75 },
            new Anime { AnimeId = 5,  Title = "Demon Slayer", TotalNrEpisodes = 44 },
            new Anime { AnimeId = 6,  Title = "My Hero Academia", TotalNrEpisodes = 88, HasWatched = true },
            new Anime { AnimeId = 7,  Title = "Death Note", TotalNrEpisodes = 37 },
            new Anime { AnimeId = 8,  Title = "Dragon Ball Z", TotalNrEpisodes = 291 },
            new Anime { AnimeId = 9,  Title = "Fullmetal Alchemist: Brotherhood", TotalNrEpisodes = 64 },
            new Anime { AnimeId = 10, Title = "Tokyo Revengers", TotalNrEpisodes = 24 },
            new Anime { AnimeId = 11, Title = "Black Clover", TotalNrEpisodes = 170 },
            new Anime { AnimeId = 12, Title = "Bleach", TotalNrEpisodes = 366 }
        };

        public IActionResult Index()
        {
            var watched = animeList.Where(a => a.HasWatched).ToList();

            ViewBag.Message = "Välkommen till Anime Tracker!";
            int totalEpisodes = watched.Sum(a => a.TotalNrEpisodes);
            ViewBag.TotalEpisodes = totalEpisodes;
            ViewBag.Hours = totalEpisodes * 24 / 60;

            ViewData["Info"] = $"Du har sett {watched.Count} anime";
            ViewBag.LastAdded = Request.Cookies["LastAdded"];

            return View(watched);
        }

        public IActionResult Discover()
        {
            return View(animeList.Where(a => !a.HasWatched).ToList());
        }

        [HttpPost]
        public IActionResult AddToList(int id)
        {
            var anime = animeList.FirstOrDefault(a => a.AnimeId == id);

            if (anime != null)
            {
                anime.HasWatched = true;
            }

            return RedirectToAction("Index");
        }

    [HttpGet]
    public IActionResult Add()
    {
        var model = new AnimeViewModel();

        return View(model);
    }

        [HttpPost]
        public IActionResult Add(AnimeViewModel model)
        {
            if (!ModelState.IsValid)
            {   model.Genres = new AnimeViewModel().Genres;
                return View(model);
            }

            var anime = new Anime
            {
                AnimeId = animeList.Max(a => a.AnimeId) + 1,
                Title = model.Title,
                TotalNrEpisodes = model.TotalNrEpisodes,
                Genre = model.Genre,
                IsFavorite = model.IsFavorite,
                HasWatched = true
            };

            animeList.Add(anime);

            Response.Cookies.Append("LastAdded", anime.Title);

            return RedirectToAction("Index");
        }
    }
}