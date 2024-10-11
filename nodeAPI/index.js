const express = require('express');
const app = express();
const port = 3000;

app.use(express.json()); 


let dados = [
    { id: 1, nome: "Antonio", curso: "DS", horarios: ["08:00", "10:15", "13:30"] },
    { id: 2, nome: "Bianca", curso: "DS", horarios: ["09:30", "11:00", "14:15"] },
    { id: 3, nome: "Celiny", curso: "DS", horarios: ["08:45", "10:15", "15:00"] },
    { id: 4, nome: "Christian", curso: "MEC", horarios: ["08:00", "09:30", "16:00"] },
    { id: 5, nome: "Felipe", curso: "MEC", horarios: ["10:15", "11:00", "16:45"] },
    { id: 6, nome: "Heloísa", curso: "MEC", horarios: ["08:45", "13:30", "17:30"] },
    { id: 7, nome: "Hyago", curso: "MAT", horarios: ["08:00", "10:15", "19:00"] },
    { id: 8, nome: "Levi", curso: "MAT", horarios: ["09:30", "14:15", "19:45"] },
    { id: 9, nome: "Luísa", curso: "MAT", horarios: ["08:45", "15:00", "16:45"] },
    { id: 10, nome: "Luiz", curso: "PORT", horarios: ["08:00", "11:00", "13:30"] },
    { id: 11, nome: "Marcos", curso: "PORT", horarios: ["10:15", "14:15", "16:00"] },
    { id: 12, nome: "Marta", curso: "PORT", horarios: ["09:30", "15:00", "17:30"] },
    { id: 13, nome: "Murilo", curso: "BIO", horarios: ["08:45", "10:15", "19:00"] },
    { id: 14, nome: "Nicoly", curso: "BIO", horarios: ["08:00", "14:15", "19:45"] },
    { id: 15, nome: "Paula", curso: "BIO", horarios: ["09:30", "16:00", "16:45"] },
    { id: 16, nome: "Rafael", curso: "ELETRO", horarios: ["08:45", "11:00", "17:30"] },
    { id: 17, nome: "Rayssa", curso: "ELETRO", horarios: ["08:00", "13:30", "16:45"] },
    { id: 18, nome: "Regina", curso: "ENF", horarios: ["10:15", "14:15", "19:00"] },
    { id: 19, nome: "Simone", curso: "ENF", horarios: ["09:30", "15:00", "19:45"] }
];



app.get('/monitores', (req, res) => {
    res.json(dados);
});


app.get('/monitor/id/:id', (req, res) => {
    const monitor = dados.find(d => d.id === parseInt(req.params.id));
    if (!monitor) return res.status(404).send('Monitor não encontrado!');
    res.json(monitor);
});

//response os dados de um monitor pelo nome passado como parametro
app.get('/monitor/nome/:nome', (req, res) => {
    const monitor = dados.find(d => d.nome === req.params.nome);
    if (!monitor) return res.status(404).send('Monitor não encontrado!');
    res.json(monitor);
});


app.post('/new/monitor', (req, res) => {
    const novoMonitor = {
        id: dados.length + 1,
        nome: req.body.nome,
        curso: req.body.curso,
        horarios: req.body.horarios
    };
    dados.push(novoMonitor);
    res.status(201).json(novoMonitor);
});


app.put('/update/monitor/:id', (req, res) => {
    const monitor = dados.find(d => d.id === parseInt(req.params.id));
    if (!monitor) return res.status(404).send('Monitor não encontrado!');

    monitor.nome = req.body.nome;
    monitor.curso = req.body.curso;
    monitor.horarios = req.body.horarios;
    res.json(monitor);
});


app.delete('/delete/monitor/:id', (req, res) => { 
    const idxmonitor = dados.findIndex(d => d.id === parseInt(req.params.id));
    if (idxmonitor === -1) return res.status(404).send('Monitor não encontrado!');
    
    dados.splice(idxmonitor, 1);
    res.status(204).send();
});

app.listen(port, () => {
    console.log(`Aplicação rodando em: http://localhost:${port}`);
});
