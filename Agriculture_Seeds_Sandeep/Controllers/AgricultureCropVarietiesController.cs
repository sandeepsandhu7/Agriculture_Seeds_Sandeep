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
    public class AgricultureCropVarietiesController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: AgricultureCropVarieties
        public ActionResult Index()
        {
            var agricultureCropVarieties = db.AgricultureCropVarieties.Include(a => a.AgricultureCrop);
            return View(agricultureCropVarieties.ToList());
        }

        // GET: AgricultureCropVarieties/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCropVariety agricultureCropVariety = db.AgricultureCropVarieties.Find(id);
            if (agricultureCropVariety == null)
            {
                return HttpNotFound();
            }
            return View(agricultureCropVariety);
        }

        // GET: AgricultureCropVarieties/Create
        public ActionResult Create()
        {
            ViewBag.AgricultureCropID = new SelectList(db.AgricultureCrops, "ID", "CropName");
            return View();
        }

        // POST: AgricultureCropVarieties/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,AgricultureCropID,VarietyName")] AgricultureCropVariety agricultureCropVariety)
        {
            if (ModelState.IsValid)
            {
                db.AgricultureCropVarieties.Add(agricultureCropVariety);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgricultureCropID = new SelectList(db.AgricultureCrops, "ID", "CropName", agricultureCropVariety.AgricultureCropID);
            return View(agricultureCropVariety);
        }

        // GET: AgricultureCropVarieties/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCropVariety agricultureCropVariety = db.AgricultureCropVarieties.Find(id);
            if (agricultureCropVariety == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgricultureCropID = new SelectList(db.AgricultureCrops, "ID", "CropName", agricultureCropVariety.AgricultureCropID);
            return View(agricultureCropVariety);
        }

        // POST: AgricultureCropVarieties/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,AgricultureCropID,VarietyName")] AgricultureCropVariety agricultureCropVariety)
        {
            if (ModelState.IsValid)
            {
                db.Entry(agricultureCropVariety).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgricultureCropID = new SelectList(db.AgricultureCrops, "ID", "CropName", agricultureCropVariety.AgricultureCropID);
            return View(agricultureCropVariety);
        }

        // GET: AgricultureCropVarieties/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCropVariety agricultureCropVariety = db.AgricultureCropVarieties.Find(id);
            if (agricultureCropVariety == null)
            {
                return HttpNotFound();
            }
            return View(agricultureCropVariety);
        }

        // POST: AgricultureCropVarieties/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AgricultureCropVariety agricultureCropVariety = db.AgricultureCropVarieties.Find(id);
            db.AgricultureCropVarieties.Remove(agricultureCropVariety);
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
