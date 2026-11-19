using Microsoft.AspNetCore.Mvc;
using AnimeTracker.Models;

namespace AnimeTracker.Controllers
{
    public class WatchlistController : Controller
    {
        private static List<Anime> watchlist = new List<Anime>();

        public IActionResult Index()
        {
            return View(watchlist);
        }

        [HttpGet]
        public IActionResult Add()
        {
            return View(new AnimeViewModel());
        }

        [HttpPost]
        public IActionResult Add(AnimeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var anime = new Anime
            {
                Title = model.Title,
                TotalNrEpisodes = model.TotalNrEpisodes,
                Genre = model.Genre,
                IsFavorite = model.IsFavorite
            };

            watchlist.Add(anime);

            return RedirectToAction("Index");
        }
    }
}
