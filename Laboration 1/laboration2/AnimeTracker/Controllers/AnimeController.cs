
using Microsoft.AspNetCore.Mvc;
using AnimeTracker.Models;

namespace AnimeTracker.Controllers
{
    public class AnimeController : Controller
    {
        private static List<Anime> animeList = new List<Anime>
        {
            new Anime
            {
                AnimeId = 1,
                Title = "Jujutsu Kaisen",
                TotalNrEpisodes = 47
            },

            new Anime
            {
                AnimeId = 2,
                Title = "Naruto",
                TotalNrEpisodes = 220
            }
        };

        public IActionResult Index()
        {
            ViewBag.Message = "Välkommen till Anime Tracker!";

            return View(animeList);
        }
        public IActionResult Add(AnimeViewModel model)
        {
            return View(model);
        }
    }
}
