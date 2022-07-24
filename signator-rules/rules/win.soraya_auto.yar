rule win_soraya_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.soraya."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.soraya"
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
        $sequence_0 = { ff15???????? 8d48bf 80f919 77f2 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   8d48bf               | lea                 ecx, [eax - 0x41]
            //   80f919               | cmp                 cl, 0x19
            //   77f2                 | ja                  0xfffffff4

        $sequence_1 = { ff15???????? 488d15b4f9ffff 488bcf ff15???????? 488bcf ff15???????? 33db }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   488d15b4f9ffff       | inc                 esp
            //   488bcf               | mov                 ecx, edi
            //   ff15????????         |                     
            //   488bcf               | inc                 ebp
            //   ff15????????         |                     
            //   33db                 | xor                 eax, eax

        $sequence_2 = { 59 68???????? 8d85ecfdffff 50 ffd6 a1???????? 0540010000 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   68????????           |                     
            //   8d85ecfdffff         | lea                 eax, [ebp - 0x214]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   a1????????           |                     
            //   0540010000           | add                 eax, 0x140

        $sequence_3 = { 68???????? 8d45d8 50 ff15???????? 85c0 7568 }
            // n = 6, score = 100
            //   68????????           |                     
            //   8d45d8               | lea                 eax, [ebp - 0x28]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7568                 | jne                 0x6a

        $sequence_4 = { 2bc3 8945dc 8b45fc 33c6 2bc3 8945dc }
            // n = 6, score = 100
            //   2bc3                 | sub                 eax, ebx
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   33c6                 | xor                 eax, esi
            //   2bc3                 | sub                 eax, ebx
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax

        $sequence_5 = { ff75fc ffd6 ff750c ff7508 e8???????? }
            // n = 5, score = 100
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd6                 | call                esi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_6 = { 8b02 23c7 8d440810 8945f4 0fbdc1 c1d30b }
            // n = 6, score = 100
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   23c7                 | and                 eax, edi
            //   8d440810             | lea                 eax, [eax + ecx + 0x10]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   0fbdc1               | bsr                 eax, ecx
            //   c1d30b               | rcl                 ebx, 0xb

        $sequence_7 = { 72dd c785ccfeffff3e23f000 c785d0feffff00000000 8b55e4 }
            // n = 4, score = 100
            //   72dd                 | jb                  0xffffffdf
            //   c785ccfeffff3e23f000     | mov    dword ptr [ebp - 0x134], 0xf0233e
            //   c785d0feffff00000000     | mov    dword ptr [ebp - 0x130], 0
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]

        $sequence_8 = { 488bf0 4885c0 0f8441020000 448bcb 458bc5 }
            // n = 5, score = 100
            //   488bf0               | inc                 ecx
            //   4885c0               | mov                 eax, dword ptr [esi]
            //   0f8441020000         | test                eax, eax
            //   448bcb               | jne                 0x15
            //   458bc5               | dec                 eax

        $sequence_9 = { ffd0 8d0437 50 ff75fc b8???????? ffd0 83c40c }
            // n = 7, score = 100
            //   ffd0                 | call                eax
            //   8d0437               | lea                 eax, [edi + esi]
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   b8????????           |                     
            //   ffd0                 | call                eax
            //   83c40c               | add                 esp, 0xc

        $sequence_10 = { 57 8b7d18 83d6ff 33db 3bd7 }
            // n = 5, score = 100
            //   57                   | push                edi
            //   8b7d18               | mov                 edi, dword ptr [ebp + 0x18]
            //   83d6ff               | adc                 esi, -1
            //   33db                 | xor                 ebx, ebx
            //   3bd7                 | cmp                 edx, edi

        $sequence_11 = { 33c3 2bc6 8945d8 8b45fc 33c3 2bc6 }
            // n = 6, score = 100
            //   33c3                 | xor                 eax, ebx
            //   2bc6                 | sub                 eax, esi
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   33c3                 | xor                 eax, ebx
            //   2bc6                 | sub                 eax, esi

        $sequence_12 = { 8b09 010c10 83453402 ff4d3c 7580 }
            // n = 5, score = 100
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   010c10               | add                 dword ptr [eax + edx], ecx
            //   83453402             | add                 dword ptr [ebp + 0x34], 2
            //   ff4d3c               | dec                 dword ptr [ebp + 0x3c]
            //   7580                 | jne                 0xffffff82

        $sequence_13 = { 50 ffd6 bb00800000 53 }
            // n = 4, score = 100
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   bb00800000           | mov                 ebx, 0x8000
            //   53                   | push                ebx

        $sequence_14 = { 33db 85db 751e 33c9 85ff }
            // n = 5, score = 100
            //   33db                 | test                esi, esi
            //   85db                 | je                  0xd
            //   751e                 | and                 dword ptr [esi], eax
            //   33c9                 | dec                 eax
            //   85ff                 | lea                 edx, [0xfffff9b4]

        $sequence_15 = { 85c0 7530 488b4c2430 897c2428 8d7801 448bcf 4533c0 }
            // n = 7, score = 100
            //   85c0                 | mov                 ecx, eax
            //   7530                 | dec                 eax
            //   488b4c2430           | arpl                word ptr [ebx + 0x3c], dx
            //   897c2428             | inc                 esp
            //   8d7801               | mov                 ebp, dword ptr [ebp + ebx + 0x20]
            //   448bcf               | mov                 dword ptr [esp + 0x2b8], eax
            //   4533c0               | movzx               eax, word ptr [edi + 0x14]

        $sequence_16 = { 488bc8 ff15???????? 4863533c 448b6c1d20 898424b8020000 0fb74714 }
            // n = 6, score = 100
            //   488bc8               | dec                 eax
            //   ff15????????         |                     
            //   4863533c             | mov                 ebx, dword ptr [esp + 0x70]
            //   448b6c1d20           | dec                 eax
            //   898424b8020000       | mov                 esi, dword ptr [esp + 0x78]
            //   0fb74714             | dec                 eax

        $sequence_17 = { 418b06 85c0 7511 4885f6 7404 2106 }
            // n = 6, score = 100
            //   418b06               | test                eax, eax
            //   85c0                 | jne                 0x32
            //   7511                 | dec                 eax
            //   4885f6               | mov                 ecx, dword ptr [esp + 0x30]
            //   7404                 | mov                 dword ptr [esp + 0x28], edi
            //   2106                 | lea                 edi, [eax + 1]

        $sequence_18 = { 85c0 746e 8b4508 2b45fc }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   746e                 | je                  0x70
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   2b45fc               | sub                 eax, dword ptr [ebp - 4]

        $sequence_19 = { ff15???????? 03c0 50 ff75fc e8???????? }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   03c0                 | add                 eax, eax
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     

        $sequence_20 = { ff7540 8b45f8 33c1 2bc3 6a04 }
            // n = 5, score = 100
            //   ff7540               | push                dword ptr [ebp + 0x40]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   33c1                 | xor                 eax, ecx
            //   2bc3                 | sub                 eax, ebx
            //   6a04                 | push                4

        $sequence_21 = { 8945e8 b8be730000 668945fc 66a1???????? b94a600000 6603c1 }
            // n = 6, score = 100
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   b8be730000           | mov                 eax, 0x73be
            //   668945fc             | mov                 word ptr [ebp - 4], ax
            //   66a1????????         |                     
            //   b94a600000           | mov                 ecx, 0x604a
            //   6603c1               | add                 ax, cx

        $sequence_22 = { ff15???????? 488bd6 488bcf ff15???????? 488b5c2470 488b742478 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   488bd6               | dec                 eax
            //   488bcf               | mov                 edx, esi
            //   ff15????????         |                     
            //   488b5c2470           | dec                 eax
            //   488b742478           | mov                 ecx, edi

    condition:
        7 of them and filesize < 188416
}