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
    public class AgricultureCropsController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: AgricultureCrops
        public ActionResult Index()
        {
            return View(db.AgricultureCrops.ToList());
        }

        // GET: AgricultureCrops/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCrop agricultureCrop = db.AgricultureCrops.Find(id);
            if (agricultureCrop == null)
            {
                return HttpNotFound();
            }
            return View(agricultureCrop);
        }

        // GET: AgricultureCrops/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AgricultureCrops/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,CropName")] AgricultureCrop agricultureCrop)
        {
            if (ModelState.IsValid)
            {
                db.AgricultureCrops.Add(agricultureCrop);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(agricultureCrop);
        }

        // GET: AgricultureCrops/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCrop agricultureCrop = db.AgricultureCrops.Find(id);
            if (agricultureCrop == null)
            {
                return HttpNotFound();
            }
            return View(agricultureCrop);
        }

        // POST: AgricultureCrops/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,CropName")] AgricultureCrop agricultureCrop)
        {
            if (ModelState.IsValid)
            {
                db.Entry(agricultureCrop).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(agricultureCrop);
        }

        // GET: AgricultureCrops/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureCrop agricultureCrop = db.AgricultureCrops.Find(id);
            if (agricultureCrop == null)
            {
                return HttpNotFound();
            }
            return View(agricultureCrop);
        }

        // POST: AgricultureCrops/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AgricultureCrop agricultureCrop = db.AgricultureCrops.Find(id);
            db.AgricultureCrops.Remove(agricultureCrop);
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
