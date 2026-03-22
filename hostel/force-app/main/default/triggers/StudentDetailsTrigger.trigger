trigger StudentDetailsTrigger on Student_Details__c 
(before insert, after insert, after update, after delete) {

    // BEFORE INSERT → Allocate Room
    if (Trigger.isBefore && Trigger.isInsert) {
        if (Trigger.new != null && !Trigger.new.isEmpty()) {
            StudentDetailsHandler.autoAllocateRoom(Trigger.new);
        }
    }

    // AFTER INSERT → Update Room Occupancy
    if (Trigger.isAfter && Trigger.isInsert) {
        if (Trigger.new != null && !Trigger.new.isEmpty()) {
            StudentDetailsHandler.updateRoomOccupancy(Trigger.new, null);
        }
    }

    // AFTER UPDATE → Handle Room Change
    if (Trigger.isAfter && Trigger.isUpdate) {
        if (Trigger.new != null && !Trigger.new.isEmpty() && Trigger.oldMap != null) {
            StudentDetailsHandler.handleRoomChange(Trigger.new, Trigger.oldMap);
        }
    }

    // AFTER DELETE → Free Room
    if (Trigger.isAfter && Trigger.isDelete) {
        if (Trigger.old != null && !Trigger.old.isEmpty()) {
            StudentDetailsHandler.freeUpRooms(Trigger.old);
        }
    }
}