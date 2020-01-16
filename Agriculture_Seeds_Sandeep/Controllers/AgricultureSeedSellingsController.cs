using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Agriculture_Seeds_Sandeep.Models;

namespace Agriculture_Seeds_Sandeep.Controllers
{
    [Authorize]
    public class AgricultureSeedSellingsController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: AgricultureSeedSellings
        public ActionResult Index()
        {
            var agricultureSeedSellings = db.AgricultureSeedSellings.Include(a => a.AgricultureCropVariety).Include(a => a.Customer);
            return View(agricultureSeedSellings.ToList());
        }

        // GET: AgricultureSeedSellings/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureSeedSelling agricultureSeedSelling = db.AgricultureSeedSellings.Find(id);
            if (agricultureSeedSelling == null)
            {
                return HttpNotFound();
            }
            return View(agricultureSeedSelling);
        }

        // GET: AgricultureSeedSellings/Create
        public ActionResult Create()
        {
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName");
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "CustomerName");
            return View();
        }

        // POST: AgricultureSeedSellings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,CustomerID,AgricultureCropVarietyID,NoofBags,Amount")] AgricultureSeedSelling agricultureSeedSelling)
        {
            if (ModelState.IsValid)
            {
                db.AgricultureSeedSellings.Add(agricultureSeedSelling);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureSeedSelling.AgricultureCropVarietyID);
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "CustomerName", agricultureSeedSelling.CustomerID);
            return View(agricultureSeedSelling);
        }

        // GET: AgricultureSeedSellings/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureSeedSelling agricultureSeedSelling = db.AgricultureSeedSellings.Find(id);
            if (agricultureSeedSelling == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureSeedSelling.AgricultureCropVarietyID);
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "CustomerName", agricultureSeedSelling.CustomerID);
            return View(agricultureSeedSelling);
        }

        // POST: AgricultureSeedSellings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,CustomerID,AgricultureCropVarietyID,NoofBags,Amount")] AgricultureSeedSelling agricultureSeedSelling)
        {
            if (ModelState.IsValid)
            {
                db.Entry(agricultureSeedSelling).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureSeedSelling.AgricultureCropVarietyID);
            ViewBag.CustomerID = new SelectList(db.Customers, "ID", "CustomerName", agricultureSeedSelling.CustomerID);
            return View(agricultureSeedSelling);
        }

        // GET: AgricultureSeedSellings/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureSeedSelling agricultureSeedSelling = db.AgricultureSeedSellings.Find(id);
            if (agricultureSeedSelling == null)
            {
                return HttpNotFound();
            }
            return View(agricultureSeedSelling);
        }

        // POST: AgricultureSeedSellings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AgricultureSeedSelling agricultureSeedSelling = db.AgricultureSeedSellings.Find(id);
            db.AgricultureSeedSellings.Remove(agricultureSeedSelling);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
