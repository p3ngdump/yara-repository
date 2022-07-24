rule win_newpass_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.newpass."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.newpass"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 7209 498b0c24 e8???????? 49c74424180f000000 49c744241000000000 41c6042400 }
            // n = 6, score = 500
            //   7209                 | movzx               eax, byte ptr [edx + eax]
            //   498b0c24             | dec                 ebp
            //   e8????????           |                     
            //   49c74424180f000000     | lea    eax, [eax + 1]
            //   49c744241000000000     | xor    al, cl
            //   41c6042400           | inc                 ecx

        $sequence_1 = { 7374 83ff08 7d0c 420fb60438 8806 48ffc6 ffc7 }
            // n = 7, score = 500
            //   7374                 | mov                 byte ptr [eax], al
            //   83ff08               | inc                 edx
            //   7d0c                 | dec                 ecx
            //   420fb60438           | inc                 eax
            //   8806                 | cmp                 edx, 8
            //   48ffc6               | jb                  0x1843
            //   ffc7                 | xor                 al, cl

        $sequence_2 = { 488d8a90000000 e9???????? 488d8a50010000 e9???????? 488d8a70010000 e9???????? 488d8a90010000 }
            // n = 7, score = 500
            //   488d8a90000000       | cmp                 dword ptr [esp + 0x1098], 0x10
            //   e9????????           |                     
            //   488d8a50010000       | dec                 eax
            //   e9????????           |                     
            //   488d8a70010000       | mov                 ecx, dword ptr [ebp + 0x570]
            //   e9????????           |                     
            //   488d8a90010000       | dec                 eax

        $sequence_3 = { 8b4530 83e008 85c0 7410 836530f7 488d8dd0000000 e8???????? }
            // n = 7, score = 500
            //   8b4530               | je                  0xc07
            //   83e008               | dec                 eax
            //   85c0                 | add                 eax, 0x10
            //   7410                 | dec                 eax
            //   836530f7             | cmp                 eax, dword ptr [edi + 0x28]
            //   488d8dd0000000       | jb                  0xbff
            //   e8????????           |                     

        $sequence_4 = { e8???????? 488bd8 488bd3 488d4d38 e8???????? 488bd8 }
            // n = 6, score = 500
            //   e8????????           |                     
            //   488bd8               | lea                 eax, [0x84a3d]
            //   488bd3               | dec                 eax
            //   488d4d38             | mov                 edx, eax
            //   e8????????           |                     
            //   488bd8               | dec                 eax

        $sequence_5 = { c744243003000000 488d5580 488bce e8???????? 488bd0 488d4de0 e8???????? }
            // n = 7, score = 500
            //   c744243003000000     | mov                 dword ptr [esp + 0x30], esi
            //   488d5580             | dec                 eax
            //   488bce               | mov                 esi, edi
            //   e8????????           |                     
            //   488bd0               | dec                 eax
            //   488d4de0             | mov                 ecx, dword ptr [edx + 0x40]
            //   e8????????           |                     

        $sequence_6 = { 48894140 488bc8 488bf8 483bc0 751e }
            // n = 5, score = 500
            //   48894140             | lea                 edx, [esp + 0x70]
            //   488bc8               | nop                 
            //   488bf8               | dec                 esp
            //   483bc0               | lea                 eax, [esp + 0x70]
            //   751e                 | dec                 eax

        $sequence_7 = { 498d78ff 4533f6 4d8bf9 498bf0 488bda 4c8be9 490faff9 }
            // n = 7, score = 500
            //   498d78ff             | mov                 byte ptr [edi], 0
            //   4533f6               | jmp                 0x61b
            //   4d8bf9               | dec                 eax
            //   498bf0               | lea                 eax, [0x7f1a3]
            //   488bda               | dec                 eax
            //   4c8be9               | mov                 edx, eax
            //   490faff9             | dec                 eax

        $sequence_8 = { 7459 498b06 4885c0 7509 488d152c830500 eb0d 488b5028 }
            // n = 7, score = 500
            //   7459                 | dec                 eax
            //   498b06               | inc                 edx
            //   4885c0               | inc                 ecx
            //   7509                 | cmp                 eax, 6
            //   488d152c830500       | jb                  0xe34
            //   eb0d                 | xor                 al, 0x81
            //   488b5028             | mov                 byte ptr [edx], al

        $sequence_9 = { e8???????? 85c0 740a b803000000 e9???????? 66833d????????00 7513 }
            // n = 7, score = 500
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   740a                 | add                 esp, 0x400
            //   b803000000           | inc                 ecx
            //   e9????????           |                     
            //   66833d????????00     |                     
            //   7513                 | pop                 edi

    condition:
        7 of them and filesize < 1286144
}