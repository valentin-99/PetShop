using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PetShopApp.DB;

namespace PetShopApp.Controllers
{
    public class UserHistoryController : Controller
    {
        private readonly PetShopContext _context;

        public UserHistoryController(PetShopContext context)
        {
            _context = context;
        }

        // GET: UserHistory
        public async Task<IActionResult> Index()
        {
            var petShopContext = _context.UserHistories.Include(u => u.User);
            return View(await petShopContext.ToListAsync());
        }

        // GET: UserHistory/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userHistory = await _context.UserHistories
                .Include(u => u.User)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (userHistory == null)
            {
                return NotFound();
            }

            return View(userHistory);
        }

        // GET: UserHistory/Create
        public IActionResult Create()
        {
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Email");
            return View();
        }

        // POST: UserHistory/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,UserId,Username,Password")] UserHistory userHistory)
        {
            if (ModelState.IsValid)
            {
                _context.Add(userHistory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Email", userHistory.UserId);
            return View(userHistory);
        }

        // GET: UserHistory/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userHistory = await _context.UserHistories.FindAsync(id);
            if (userHistory == null)
            {
                return NotFound();
            }
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Email", userHistory.UserId);
            return View(userHistory);
        }

        // POST: UserHistory/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,UserId,Username,Password")] UserHistory userHistory)
        {
            if (id != userHistory.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(userHistory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserHistoryExists(userHistory.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "Email", userHistory.UserId);
            return View(userHistory);
        }

        // GET: UserHistory/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userHistory = await _context.UserHistories
                .Include(u => u.User)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (userHistory == null)
            {
                return NotFound();
            }

            return View(userHistory);
        }

        // POST: UserHistory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var userHistory = await _context.UserHistories.FindAsync(id);
            _context.UserHistories.Remove(userHistory);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UserHistoryExists(int id)
        {
            return _context.UserHistories.Any(e => e.Id == id);
        }
    }
}
