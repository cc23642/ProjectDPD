const express = require('express');
const app = express();
const port = 3000;

app.use(express.json()); 


let dados = [
    {
        id: 1,
        nome: "Antonio",
        curso: "DS",
        horarios: {
            Segunda: ["08:00", "11:00", "16:00"],
            Terca: ["09:30", "14:15"],
            Quarta: ["08:00", "10:15", "15:45"],
            Quinta: [],
            Sexta: ["08:45", "14:15", "19:00"],
            Sabado: ["08:00", "10:15"]
        }
    },
    {
        id: 2,
        nome: "Bianca",
        curso: "DS",
        horarios: {
            Segunda: [],
            Terca: ["09:30", "11:00"],
            Quarta: ["08:45", "10:15"],
            Quinta: ["08:45", "10:15", "15:00"],
            Sexta: ["08:45", "14:15"],
            Sabado: ["08:00", "09:30", "11:00"]
        }
    },
    {
        id: 3,
        nome: "Celiny",
        curso: "DS",
        horarios: {
            Segunda: ["08:45", "15:00"],
            Terca: [],
            Quarta: ["08:45", "10:15"],
            Quinta: ["08:45"],
            Sexta: ["09:30", "13:30"],
            Sabado: ["09:30", "11:00"]
        }
    },
    {
        id: 4,
        nome: "Christian",
        curso: "MEC",
        horarios: {
            Segunda: ["08:00", "09:30"],
            Terca: ["08:45", "10:15", "16:00"],
            Quarta: ["09:30", "14:15"],
            Quinta: ["08:00", "16:00"],
            Sexta: ["08:00"],
            Sabado: ["08:45"]
        }
    },
    {
        id: 5,
        nome: "Felipe",
        curso: "MEC",
        horarios: {
            Segunda: ["16:45"],
            Terca: ["09:30", "13:30"],
            Quarta: ["08:45", ],
            Quinta: ["09:00"],
            Sexta: [],
            Sabado: ["09:30", "10:45"]
        }
    },
    {
        id: 6,
        nome: "Heloysa",
        curso: "MEC",
        horarios: {
            Segunda: ["08:45", "13:30", "17:30"],
            Terca: ["09:00", "10:45"],
            Quarta: ["08:00", "14:15", "19:00"],
            Quinta: [, "11:00"],
            Sexta: ["08:00", "16:00"],
            Sabado: ["10:15", "12:00"]
        }
    },
    {
        id: 7,
        nome: "Hyago",
        curso: "MAT",
        horarios: {
            Segunda: ["08:00", "19:00"],
            Terca: ["10:45", "14:00"],
            Quarta: ["08:30", "12:15"],
            Quinta: ["10:00", "15:15"],
            Sexta: ["09:45", "17:00"],
            Sabado: ["08:30", "09:45"]
        }
    },
    {
        id: 8,
        nome: "Levi",
        curso: "MAT",
        horarios: {
            Segunda: [],
            Terca: ["10:15", "12:45"],
            Quarta: ["08:00", "16:15"],
            Quinta: ["09:30", "13:00"],
            Sexta: ["10:00", "17:30"],
            Sabado: ["09:45", "11:00"]
        }
    },
    {
        id: 9,
        nome: "Luisa",
        curso: "MAT",
        horarios: {
            Segunda: [],
            Terca: ["10:30", "12:00"],
            Quarta: ["09:45", "13:00"],
            Quinta: ["08:15", "14:00"],
            Sexta: ["11:00", "18:30"],
            Sabado: ["08:00", "09:30"]
        }
    },
    {
        id: 10,
        nome: "Luiz",
        curso: "PORT",
        horarios: {
            Segunda: [],
            Terca: ["09:15", "14:15"],
            Quarta: ["10:00", "16:00"],
            Quinta: ["08:45", "10:30"],
            Sexta: ["08:30", "12:45"],
            Sabado: ["08:30", "10:00"]
        }
    },
    {
        id: 11,
        nome: "Marcos",
        curso: "PORT",
        horarios: {
            Segunda: ["10:15", "14:15", "16:00"],
            Terca: ["08:45", "12:00"],
            Quarta: ["09:00", "17:00"],
            Quinta: ["15:00"],
            Sexta: ["09:15", "11:45"],
            Sabado: ["08:00", "10:30"]
        }
    },
    {
        id: 12,
        nome: "Marta",
        curso: "PORT",
        horarios: {
            Segunda: ["09:30", "15:00", "17:30"],
            Terca: ["11:00", "13:45"],
            Quarta: ["09:15"],
            Quinta: ["08:45"],
            Sexta: ["10:00", "18:30"],
            Sabado: ["09:30", "11:15"]
        }
    },
    {
        id: 13,
        nome: "Murilo",
        curso: "BIO",
        horarios: {
            Segunda: ["08:45", "10:15", "19:00"],
            Terca: ["09:30", "13:45"],
            Quarta: ["10:00", "16:00"],
            Quinta: ["11:30", "14:45"],
            Sexta: ["09:00", "18:00"],
            Sabado: ["08:15", "10:45"]
        }
    },
    {
        id: 14,
        nome: "Nicoly",
        curso: "BIO",
        horarios: {
            Segunda: ["08:00", "14:15", "19:45"],
            Terca: [],
            Quarta: [],
            Quinta: ["08:30", "11:30"],
            Sexta: ["09:45", "18:15"],
            Sabado: ["08:30", "10:30"]
        }
    },
    {
        id: 15,
        nome: "Paula",
        curso: "BIO",
        horarios: {
            Segunda: ["09:30", "16:00", "16:45"],
            Terca: ["08:15", "10:00"],
            Quarta: [],
            Quinta: ["08:00", "12:45"],
            Sexta: ["09:00", "17:00"],
            Sabado: ["09:45", "11:15"]
        }
    },
    {
        id: 16,
        nome: "Rafael",
        curso: "ELETRO",
        horarios: {
            Segunda: ["17:30"],
            Terca: ["09:15", "13:30"],
            Quarta: ["10:45", "16:45"],
            Quinta: [],
            Sexta: [],
            Sabado: []
        }
    },
    {
        id: 17,
        nome: "Rayssa",
        curso: "ELETRO",
        horarios: {
            Segunda: ["08:00", "13:30", "16:45"],
            Terca: ["10:15", "12:00"],
            Quarta: ["09:00", "14:15"],
            Quinta: [],
            Sexta: ["09:30", "15:45"],
            Sabado: []
        }
    },
    {
        id: 18,
        nome: "Regina",
        curso: "ENF",
        horarios: {
            Segunda: ["10:15", "14:15", "19:00"],
            Terca: ["11:00", "12:45"],
            Quarta: ["09:30", "17:15"],
            Quinta: ["08:15", "10:45"],
            Sexta: ["09:30", "14:45"],
            Sabado: ["09:15", "10:30"]
        }
    },
    {
        id: 19,
        nome: "Simone",
        curso: "ENF",
        horarios: {
            Segunda: ["09:30", "15:00", "19:45"],
            Terca: ["10:00", "14:45"],
            Quarta: ["08:30", "12:45"],
            Quinta: ["09:15", "16:00"],
            Sexta: ["09:45", "18:00"],
            Sabado: []
        }
    }
];




app.get('/monitor', (req, res) => {
    res.json(dados);
});


app.get('/monitor/id/:id', (req, res) => {
    const monitor = dados.find(d => d.id === parseInt(req.params.id));
    if (!monitor) return res.status(404).send('Monitor não encontrado!');
    res.json(monitor);
});


app.get('/monitor/nome/:nome', (req, res) => {
    const monitor = dados.find(d => d.nome === req.params.nome);
    if (!monitor) return res.status(404).send('Monitor não encontrado!');
    res.json(monitor);
});


app.get('/monitor/nome/horario/:nome', (req, res) => {
    const monitor = dados.find(d => d.nome === req.params.nome);
    let horarios = monitor.horarios;
    if (!monitor) return res.status(404).send('Monitor não encontrado!');
    res.json(horarios);
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
