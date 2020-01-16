namespace Agriculture_Seeds_Sandeep.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AgricultureCropRates",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        AgricultureCropVarietyID = c.Int(nullable: false),
                        Rate = c.String(),
                        Quantity = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.AgricultureCropVarieties", t => t.AgricultureCropVarietyID, cascadeDelete: true)
                .Index(t => t.AgricultureCropVarietyID);
            
            CreateTable(
                "dbo.AgricultureCropVarieties",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        AgricultureCropID = c.Int(nullable: false),
                        VarietyName = c.String(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.AgricultureCrops", t => t.AgricultureCropID, cascadeDelete: true)
                .Index(t => t.AgricultureCropID);
            
            CreateTable(
                "dbo.AgricultureCrops",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        CropName = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.AgricultureSeedSellings",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        CustomerID = c.Int(nullable: false),
                        AgricultureCropVarietyID = c.Int(nullable: false),
                        NoofBags = c.String(),
                        Amount = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.AgricultureCropVarieties", t => t.AgricultureCropVarietyID, cascadeDelete: true)
                .ForeignKey("dbo.Customers", t => t.CustomerID, cascadeDelete: true)
                .Index(t => t.CustomerID)
                .Index(t => t.AgricultureCropVarietyID);
            
            CreateTable(
                "dbo.Customers",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        CustomerName = c.String(),
                        PhoneNumber = c.String(),
                        Address = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.AgricultureStores",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        AgricultureCropVarietyID = c.Int(nullable: false),
                        Quantity = c.Decimal(nullable: false, precision: 18, scale: 2),
                        NoofBags = c.String(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.AgricultureCropVarieties", t => t.AgricultureCropVarietyID, cascadeDelete: true)
                .Index(t => t.AgricultureCropVarietyID);
            
            CreateTable(
                "dbo.BankPayments",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        TransactionDate = c.DateTime(nullable: false),
                        TransactionNumber = c.String(),
                        AmountReceived = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.AspNetRoles",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Name = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true, name: "RoleNameIndex");
            
            CreateTable(
                "dbo.AspNetUserRoles",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        RoleId = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("dbo.AspNetRoles", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.AspNetUsers",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Email = c.String(maxLength: 256),
                        EmailConfirmed = c.Boolean(nullable: false),
                        PasswordHash = c.String(),
                        SecurityStamp = c.String(),
                        PhoneNumber = c.String(),
                        PhoneNumberConfirmed = c.Boolean(nullable: false),
                        TwoFactorEnabled = c.Boolean(nullable: false),
                        LockoutEndDateUtc = c.DateTime(),
                        LockoutEnabled = c.Boolean(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.UserName, unique: true, name: "UserNameIndex");
            
            CreateTable(
                "dbo.AspNetUserClaims",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.String(nullable: false, maxLength: 128),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.AspNetUserLogins",
                c => new
                    {
                        LoginProvider = c.String(nullable: false, maxLength: 128),
                        ProviderKey = c.String(nullable: false, maxLength: 128),
                        UserId = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.LoginProvider, t.ProviderKey, t.UserId })
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AspNetUserRoles", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserLogins", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserClaims", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserRoles", "RoleId", "dbo.AspNetRoles");
            DropForeignKey("dbo.AgricultureStores", "AgricultureCropVarietyID", "dbo.AgricultureCropVarieties");
            DropForeignKey("dbo.AgricultureSeedSellings", "CustomerID", "dbo.Customers");
            DropForeignKey("dbo.AgricultureSeedSellings", "AgricultureCropVarietyID", "dbo.AgricultureCropVarieties");
            DropForeignKey("dbo.AgricultureCropRates", "AgricultureCropVarietyID", "dbo.AgricultureCropVarieties");
            DropForeignKey("dbo.AgricultureCropVarieties", "AgricultureCropID", "dbo.AgricultureCrops");
            DropIndex("dbo.AspNetUserLogins", new[] { "UserId" });
            DropIndex("dbo.AspNetUserClaims", new[] { "UserId" });
            DropIndex("dbo.AspNetUsers", "UserNameIndex");
            DropIndex("dbo.AspNetUserRoles", new[] { "RoleId" });
            DropIndex("dbo.AspNetUserRoles", new[] { "UserId" });
            DropIndex("dbo.AspNetRoles", "RoleNameIndex");
            DropIndex("dbo.AgricultureStores", new[] { "AgricultureCropVarietyID" });
            DropIndex("dbo.AgricultureSeedSellings", new[] { "AgricultureCropVarietyID" });
            DropIndex("dbo.AgricultureSeedSellings", new[] { "CustomerID" });
            DropIndex("dbo.AgricultureCropVarieties", new[] { "AgricultureCropID" });
            DropIndex("dbo.AgricultureCropRates", new[] { "AgricultureCropVarietyID" });
            DropTable("dbo.AspNetUserLogins");
            DropTable("dbo.AspNetUserClaims");
            DropTable("dbo.AspNetUsers");
            DropTable("dbo.AspNetUserRoles");
            DropTable("dbo.AspNetRoles");
            DropTable("dbo.BankPayments");
            DropTable("dbo.AgricultureStores");
            DropTable("dbo.Customers");
            DropTable("dbo.AgricultureSeedSellings");
            DropTable("dbo.AgricultureCrops");
            DropTable("dbo.AgricultureCropVarieties");
            DropTable("dbo.AgricultureCropRates");
        }
    }
}
