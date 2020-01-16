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
    public class AgricultureStoresController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: AgricultureStores
        public ActionResult Index()
        {
            var agricultureStores = db.AgricultureStores.Include(a => a.AgricultureCropVariety);
            return View(agricultureStores.ToList());
        }

        // GET: AgricultureStores/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureStore agricultureStore = db.AgricultureStores.Find(id);
            if (agricultureStore == null)
            {
                return HttpNotFound();
            }
            return View(agricultureStore);
        }

        // GET: AgricultureStores/Create
        public ActionResult Create()
        {
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName");
            return View();
        }

        // POST: AgricultureStores/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,AgricultureCropVarietyID,Quantity,NoofBags")] AgricultureStore agricultureStore)
        {
            if (ModelState.IsValid)
            {
                db.AgricultureStores.Add(agricultureStore);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureStore.AgricultureCropVarietyID);
            return View(agricultureStore);
        }

        // GET: AgricultureStores/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureStore agricultureStore = db.AgricultureStores.Find(id);
            if (agricultureStore == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureStore.AgricultureCropVarietyID);
            return View(agricultureStore);
        }

        // POST: AgricultureStores/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,AgricultureCropVarietyID,Quantity,NoofBags")] AgricultureStore agricultureStore)
        {
            if (ModelState.IsValid)
            {
                db.Entry(agricultureStore).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgricultureCropVarietyID = new SelectList(db.AgricultureCropVarieties, "ID", "VarietyName", agricultureStore.AgricultureCropVarietyID);
            return View(agricultureStore);
        }

        // GET: AgricultureStores/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AgricultureStore agricultureStore = db.AgricultureStores.Find(id);
            if (agricultureStore == null)
            {
                return HttpNotFound();
            }
            return View(agricultureStore);
        }

        // POST: AgricultureStores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AgricultureStore agricultureStore = db.AgricultureStores.Find(id);
            db.AgricultureStores.Remove(agricultureStore);
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
