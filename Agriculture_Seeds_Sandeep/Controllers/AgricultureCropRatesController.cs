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
    public class AgricultureCropRatesController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: AgricultureCropRates
        public ActionResult Index()
        {
            var agricultureCropRates = db.AgricultureCropRates.Include(a => a.AgricultureCropVariety);
            return View(agricultureCropRates.ToList());
        }

        // GET: AgricultureCropRates/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCropRate agricultureCropRate = db.AgricultureCropRates.Find(id);
            if (agricultureCropRate == null)
            {
                return HttpNotFound();
            }
            return View(agricultureCropRate);
        }

        // GET: AgricultureCropRates/Create
        public ActionResult Create()
        {
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName");
            return View();
        }

        // POST: AgricultureCropRates/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,AgricultureCropVarietyID,Rate,Quantity")] AgricultureCropRate agricultureCropRate)
        {
            if (ModelState.IsValid)
            {
                db.AgricultureCropRates.Add(agricultureCropRate);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureCropRate.AgricultureCropVarietyID);
            return View(agricultureCropRate);
        }

        // GET: AgricultureCropRates/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCropRate agricultureCropRate = db.AgricultureCropRates.Find(id);
            if (agricultureCropRate == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureCropRate.AgricultureCropVarietyID);
            return View(agricultureCropRate);
        }

        // POST: AgricultureCropRates/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,AgricultureCropVarietyID,Rate,Quantity")] AgricultureCropRate agricultureCropRate)
        {
            if (ModelState.IsValid)
            {
                db.Entry(agricultureCropRate).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureCropRate.AgricultureCropVarietyID);
            return View(agricultureCropRate);
        }

        // GET: AgricultureCropRates/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCropRate agricultureCropRate = db.AgricultureCropRates.Find(id);
            if (agricultureCropRate == null)
            {
                return HttpNotFound();
            }
            return View(agricultureCropRate);
        }

        // POST: AgricultureCropRates/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AgricultureCropRate agricultureCropRate = db.AgricultureCropRates.Find(id);
            db.AgricultureCropRates.Remove(agricultureCropRate);
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
