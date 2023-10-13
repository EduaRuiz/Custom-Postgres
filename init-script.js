db = db.getSiblingDB("inventory");

db.event.insert({
  aggregateRootId: "aca0101c-2ee6-4d46-b6c1-87463f47c216",
  eventBody: {
    id: "35a64a10-8288-4d8c-bc20-1aad606eff15",
    name: "SuperAdmin",
    email: "superadmin@superadmin.com",
    password: "superadmin",
    role: "superAdmin",
    branchId: "NULL",
  },
  occurredOn: new Date(),
  typeName: "user.registered",
});
