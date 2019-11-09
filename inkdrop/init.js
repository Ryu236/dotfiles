// Set up a template for weekly note.
inkdrop.commands.add(document.body, "custom:new-weekly-note", async () => {
  const db = inkdrop.main.dataStore.getLocalDB()
  const template = await db.notes.get("note:eBBlP0RaU")
  const today = new Date()
  const month = today.getMonth() + 1
  const date = today.getDate()
  const lastDate = new Date(today)
  lastDate.setDate(today.getDate() + 5)
  const finishMonth = lastDate.getMonth() + 1
  const finishDate = lastDate.getDate()
  const note = {
    ...template,
    _id: db.notes.createId(),
    _rev: undefined,
    title: "Weekly note（" + month+'/'+date +' ~ ' + finishMonth+'/'+finishDate + "）",
    createdAt: +new Date(),
    updatedAt: +new Date(),
  }
  try {
    await db.notes.put(note)
    inkdrop.commands.dispatch(document.body, "core:open-note", {
      noteId: note._id,
    })
    inkdrop.commands.dispatch(document.body, "editor:focus-mde")
  } catch (e) {
    console.error(e)
  }
})

// Add menu for creating template
inkdrop.menu.add([
  {
    label: "File",
    submenu: [
      {
        label: "Templates",
        submenu: [
          {
            label: "Create a weekly note",
            command: "custom:new-weekly-note",
          },
        ],
      },
    ],
  },
])

